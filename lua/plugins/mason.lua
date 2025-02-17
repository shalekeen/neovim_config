return {
    url = "https://github.com/williamboman/mason.nvim",
    init = function(_)
        require("mason").setup()
    end,
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
            "clang-format",
            "black",
        },
        automatic_installation = true,
    },
}
