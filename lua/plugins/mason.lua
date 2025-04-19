-- Install LSP servers and 3rd-party tools
-- https://github.com/williamboman/mason.nvim

local PACKAGES = {
    "bash-language-server", --bashls
    "clangd",               --clangd
    "clang-format",
    "css-lsp",              --cssls
    "cssmodules-language-server",
    "css-variables-language-server",
    "dockerfile-language-server",   --dockerls
    "glsl_analyzer",
    "graphql-language-service-cli", --graphql
    "html-lsp",
    "json-lsp",                     --jsonls
    "kotlin-language-server",       --kotlin_language_server
    "lua-language-server",          --lua_ls
    "marksman",
    "pyright",
    "rust-analyzer", --rust_analyzer
    "yaml-language-server",
    -- Format
    "autoflake",
    "autopep8",
    "black",
    "prettierd",
    "stylua",
    -- Lint
    "eslint-lsp",
    "pylint",
}

local function install(pack, version)
    local notifyOpts = { title = "Mason", icon = "", id = "mason.install" }

    local msg = version and ("[%s] updating to %s…"):format(pack.name, version)
        or ("[%s] installing…"):format(pack.name)
    vim.defer_fn(function()
        vim.notify(msg, nil, notifyOpts)
    end, 0)

    pack:once("install:success", function()
        local msg2 = ("[%s] %s"):format(pack.name, version and "updated." or "installed.")
        notifyOpts.icon = " "
        vim.defer_fn(function()
            vim.notify(msg2, nil, notifyOpts)
        end, 0)
    end)

    pack:once("install:failed", function()
        local error = "Failed to install [" .. pack.name .. "]"
        vim.defer_fn(function()
            vim.notify(error, vim.log.levels.ERROR, notifyOpts)
        end, 0)
    end)

    pack:install({ version = version })
end

local function syncPackages(ensurePacks)
    local masonReg = require("mason-registry")

    local function refreshCallback()
        -- Auto-install missing packages & auto-update installed ones
        vim.iter(ensurePacks):each(function(packName)
            -- Extract package name and pinned version if specified
            local name, pinnedVersion = packName:match("([^@]+)@?(.*)")
            if not masonReg.has_package(name) then
                return
            end
            local pack = masonReg.get_package(name)
            if pack:is_installed() then
                -- Only check for updates if no version was pinned
                if pinnedVersion == "" then
                    pack:check_new_version(function(hasNewVersion, version)
                        if not hasNewVersion then
                            return
                        end
                        install(pack, version.latest_version)
                    end)
                end
            else
                -- Install with pinned version if specified
                install(pack, pinnedVersion ~= "" and pinnedVersion or nil)
            end
        end)

        -- Auto-clean unused packages
        local installedPackages = masonReg.get_installed_package_names()
        vim.iter(installedPackages):each(function(packName)
            -- Check if installed package is in our ensure list (without version suffix)
            local isEnsured = vim.iter(ensurePacks):any(function(ensurePack)
                local name = ensurePack:match("([^@]+)")
                return name == packName
            end)

            if not isEnsured then
                masonReg.get_package(packName):uninstall()
                local msg = ("[%s] uninstalled."):format(packName)
                vim.defer_fn(function()
                    vim.notify(msg, nil, { title = "Mason", icon = "󰅗" })
                end, 0)
            end
        end)
    end

    masonReg.refresh(refreshCallback)
end

return {
    "williamboman/mason.nvim",
    init = function()
        -- Make mason packages available before loading it; allows to lazy-load mason.
        vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH
        -- Do not crowd home directory with NPM cache folder
        vim.env.npm_config_cache = vim.env.HOME .. "/.cache/npm"
    end,
    opts = {
        ui = {
            border = "single",
            height = 0.85,
            width = 0.8,
        },
    },
    config = function(_, opts)
        require("mason").setup(opts)
        vim.defer_fn(function()
            syncPackages(PACKAGES)
        end, 3000)
    end,

    enabled = not vim.g.vscode,
    event = { "VeryLazy" },
}
