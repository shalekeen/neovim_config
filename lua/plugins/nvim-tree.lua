local function opts(desc)
    return {
        desc = "nvim-tree: " .. desc,
        noremap = true,
        silent = true,
        nowait = true
    }
end

local function on_attach(buff)
    local api = require "nvim-tree.api"
    api.config.mappings.default_on_attach(buff)
    vim.keymap.set('n', '<C-o>', ":NvimTreeToggle<cr>", opts("Toggle"))
    vim.g.nvim_tree_respect_buf_cwd = 1
end

return {
    url = "https://github.com/nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    init = function(_)
        require('nvim-tree.api').tree.open()
    end,
    opts = {
        sort = {
            sorter = "case_sensitive",
        },
        view = {
            width = 30,
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = false,
        },
        on_attach = on_attach
    }
}
