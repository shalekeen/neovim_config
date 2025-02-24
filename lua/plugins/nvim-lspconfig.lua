return {
    url = "https://github.com/neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require('lspconfig')
        lspconfig.flow.setup({})
    end
}
