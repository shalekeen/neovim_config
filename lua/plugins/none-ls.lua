return {
    url = "https://github.com/nvimtools/none-ls.nvim",
    dependencies = {
        "https://github.com/nvim-lua/plenary.nvim",
        "https://github.com/davidmh/cspell.nvim"
    },
    config = function()
        local null_ls = require('null-ls')
        local cspell = require('cspell')
        null_ls.setup({
            autostart = true,
            sources = {
                cspell.code_actions,
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.diagnostics.pylint,
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.formatting.google_java_format,
                null_ls.builtins.diagnostics.checkmake,
                null_ls.builtins.diagnostics.codespell,
                null_ls.builtins.diagnostics.commitlint,
                null_ls.builtins.formatting.shfmt
            },
            on_attach = function(_, bufnr)
                local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                        -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                        vim.lsp.buf.format({ bufnr = bufnr, async = false })
                    end,
                })
            end,

        })
    end
}
