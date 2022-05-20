-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- core
    use 'tpope/vim-dispatch'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' } -- optional file icon
    }
    use 'ervandew/supertab'
    use 'preservim/tagbar'

    -- fuzzy finder
    use { 'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
    use { 'junegunn/fzf.vim' }

    -- git
    use 'tpope/vim-fugitive'
    use 'APZelos/blamer.nvim'

    -- UI
    use 'morhetz/gruvbox'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- syntax
    use 'neovim/nvim-lspconfig'
    use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate", }
    use 'mfussenegger/nvim-lint'

end)
