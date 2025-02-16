local function opts(desc)
    return {
        desc = "nvim-tree: " .. desc,
        noremap = true,
        silent = true,
        nowait = true
    }
end

return {
    url = "https://github.com/nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    disable_netrw = true,
    hijac_netrw = true,
    update_cwd = true,
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
    }
}
