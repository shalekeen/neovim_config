return {
    url = "https://github.com/williamboman/mason-lspconfig.nvim",
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
