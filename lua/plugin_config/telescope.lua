require('telescope').setup({})
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p', builtin.find_files, {})
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>f', builtin.live_grep, {})
vim.keymap.set('n', '<Space>h', builtin.help_tags, {})
