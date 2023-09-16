vim.g.mapleader = '<Space>'
vim.g.maplocalleader= ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.autochdir = true
vim.opt.background = 'dark'

vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.completeopt = "menuone,noselect"
vim.opt.number = true
vim.opt.mouse = 'a'

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.wrap = true
vim.opt.breakindent = true

vim.wo.colorcolumn = '80'

vim.keymap.set({'n', 'x'}, 'C-p', '"+y')
vim.keymap.set({'n', 'x'}, 'C-v', '"+p')
vim.keymap.set({'n', 'x'}, 'x', '"_x')
