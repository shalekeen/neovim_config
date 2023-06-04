vim.g.leaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
sort_by = "extension",
view = {
    width = 30,
},
renderer = {
    group_empty = true,

},
filters = {
    dotfiles = true,
},
})

vim.keymap.set('n', '<c-o>', ':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<c-i>', ':NvimTreeFocus<CR>')
vim.keymap.set('n', '<c-r>', ':NvimTreeRefresh<CR>')
