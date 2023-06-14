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

vim.keymap.set('n', '<C-o>', ':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<C-r>', ':NvimTreeRefresh<CR>')
