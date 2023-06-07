local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'rebelot/kanagawa.nvim'
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use {
      'williamboman/mason.nvim',
      run = ":MasonUpdate"
  }
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'nvim-treesitter/nvim-treesitter'
  use  {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.1',
      requires = {{ 'nvim-lua/plenary.nvim' }}
  }
  use {
      'akinsho/flutter-tools.nvim',
      requires = {
          'nvim-lua/plenary.nvim',
          'stevearc/dressing.nvim',
      }
  }
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use {
      'hrsh7th/nvim-cmp',
      requires = {
	'SirVer/ultisnips',
	'honza/vim-snippets',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-calc',
	'f3fora/cmp-spell',
	'tamago324/cmp-zsh',
	'quangnguyen30192/cmp-nvim-ultisnips',
	'hrsh7th/cmp-nvim-lsp-signature-help'
      }
  }
  use {
	  'jose-elias-alvarez/null-ls.nvim',
	  requires = {
		  'nvim-lua/plenary.nvim'
	  }
  }
  use {
        'romgrk/barbar.nvim',
        requires = {
            'lewis6991/gitsigns.nvim',
        }
  }
  use {
	'lewis6991/gitsigns.nvim',
	config = function()
		require('gitsigns').setup()
	    end
  }
  if packer_bootstrap then
    require('packer').sync()
  end
end)
