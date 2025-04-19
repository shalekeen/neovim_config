return {
    url = 'https://github.com/stevearc/conform.nvim',
    opts = {},
    config = function(_, opts)
        require("conform").setup({
            formatters_by_ft = {
                -- Conform will run multiple formatters sequentially
                cpp = { "clang-format" },
                python = { "autoflake", "autopep8" },
                -- You can customize some of the format options for the filetype (:help conform.format)
                rust = { "rustfmt", lsp_format = "fallback" },
                -- Conform will run the first available formatter
                javascript = { "prettierd", "prettier", stop_after_first = true },
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        })
    end
}
