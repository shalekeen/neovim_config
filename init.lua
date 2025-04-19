require("config.lazy")
require("config.options")
require("config.keymaps")

-- Load all LSP's in "lua/config/lsp"
local lsp_path = vim.fn.stdpath("config") .. "/lua/config/lsp"

local function setup_lsp()
    local lsp_dir = vim.fn.stdpath("config") .. "/lsp"
    local lsp_servers = {}

    if vim.fn.isdirectory(lsp_dir) == 1 then
        for _, file in ipairs(vim.fn.readdir(lsp_dir)) do
            if file:match("%.lua$") and file ~= "init.lua" then
                local server_name = file:gsub("%.lua$", "")
                table.insert(lsp_servers, server_name)
            end
        end
    end

    vim.lsp.enable(lsp_servers)
end

setup_lsp()
