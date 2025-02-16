local function opts(desc)
    return {
        desc = desc,
        noremap = true,
        silent = true,
        nowait = true
    }
end

-- Nvim Tree
vim.api.nvim_set_keymap('n', '<Leader>o', ':NvimTreeToggle<CR>',
    opts("Open nvim-tree to cwd"))
vim.api.nvim_set_keymap('n', '<Leader>r', ':NvimTreeRefresh<CR>',
    opts("Refresh nvim-tree"))

-- Barbar
vim.api.nvim_set_keymap('n', '<A-1>', ':BufferGoto 1<CR>', opts("Go to tab 1"))
vim.api.nvim_set_keymap('n', '<A-2>', ':BufferGoto 2<CR>', opts("Go to tab 2"))
vim.api.nvim_set_keymap('n', '<A-3>', ':BufferGoto 3<CR>', opts("Go to tab 3"))
vim.api.nvim_set_keymap('n', '<A-4>', ':BufferGoto 4<CR>', opts("Go to tab 4"))
vim.api.nvim_set_keymap('n', '<A-5>', ':BufferGoto 5<CR>', opts("Go to tab 5"))
vim.api.nvim_set_keymap('n', '<A-6>', ':BufferGoto 6<CR>', opts("Go to tab 6"))
vim.api.nvim_set_keymap('n', '<A-7>', ':BufferGoto 7<CR>', opts("Go to tab 7"))
vim.api.nvim_set_keymap('n', '<A-8>', ':BufferGoto 8<CR>', opts("Go to tab 8"))
vim.api.nvim_set_keymap('n', '<A-9>', ':BufferGoto 9<CR>', opts("Go to tab 9"))

vim.api.nvim_set_keymap('n', '<Leader>h', ':BufferPrevious<CR>', opts("Go to previous tab"))
vim.api.nvim_set_keymap('n', '<Leader>l', ':BufferNext<CR>', opts("Go to next tab"))

vim.api.nvim_set_keymap('n', '<A-h>', ':BufferMovePrevious<CR>', opts("Move tab to the left"))
vim.api.nvim_set_keymap('n', '<A-l>', ':BufferMoveNext<CR>', opts("Move tab to the right"))

vim.api.nvim_set_keymap('n', '<A-p>', ':BufferPin<CR>', opts("Pin tab"))

vim.api.nvim_set_keymap('n', '<A-d>', ':BufferClose<CR>', opts("Close tab"))
