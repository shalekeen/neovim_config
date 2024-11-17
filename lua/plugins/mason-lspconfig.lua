return {
    url = "https://github.com/williamboman/mason-lspconfig.nvim",
    opt = {
        ensure_installed = {
            "bash-language-server",         --bashls
            "clangd",                       --clangd
            "css-lsp",                      --cssls
            "dockerfile-language-server",   --dockerls
            "eslint-lsp",                   --eslint
            "glsl_analyzer",
            "graphql-language-service-cli", --graphql
            "htmx-lsp",                     --htmx
            "java-language-server",         --java_language_server
            "json-lsp",                     --jsonls
            "kotlin-language-server",       --kotlin_language_server
            "lua-language-server",          --lua_ls
            "marksman",
            "pyright",
            "rust-analyzer", --rust_analyzer
        },
        automatic_installation = true,
    },
    config = function(setup_table)
        require('mason-lspconfig').setup(setup_table)
        require('mason-lspconfig').setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({})
            end,

        })
    end,
    dependencies = {
        "https://github.com/williamboman/mason.nvim",
        "https://github.com/neovim/nvim-lspconfig",
    },
}
