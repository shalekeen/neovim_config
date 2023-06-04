require('nvim-treesitter.install').prefer_git = true

require('nvim-treesitter.configs').setup({
    ensure_installed = {"jsdoc", "css", "javascript", "kotlin", "latex", "lua", "make", "markdown", "markdown_inline", "java", "svelte", "typescript", "rust", "sql", "cpp", "c", "cmake"},
    sync_install = true,
    auto_install = true,
    highlight = {
        enable = true,
    },
    indent = { enable = true, disable = {"python", "css"} },
})
