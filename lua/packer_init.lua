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
    -- use 'ervandew/supertab'
    use 'preservim/tagbar'

    -- fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- git
    use 'tpope/vim-fugitive'
    use 'APZelos/blamer.nvim'

    -- UI
    use { "ellisonleao/gruvbox.nvim" }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'echasnovski/mini.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'     -- autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'hrsh7th/vim-vsnip'
    -- use 'jose-elias-alvarez/null-ls.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use { 'kaarmu/typst.vim', ft = { 'typst' } }
    use 'mfussenegger/nvim-lint'

    -- debugging
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

    -- syntax
    use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate", }

    -- github copilot
    use 'github/copilot.vim'
end)
