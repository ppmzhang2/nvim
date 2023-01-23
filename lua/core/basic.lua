-- ============================================================================
-- helpers
-- ============================================================================
-- local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
-- local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
-- local g = vim.g      -- a table to access global variables
-- local opt = vim.opt  -- to set options
--
-- reference
-- 1. https://oroques.dev/2020/01/07/neovim-05.html


-- ============================================================================
-- general
-- ============================================================================
-- 4s delay is too much
-- used by YCM hover, nerdtree-git-plugin, etc.
vim.o.updatetime = 2000

-- how many lines of history VIM has to remember
vim.g.history = 500

-- With a map leader it's possible to do extra key combinations
-- like <leader>w saves the current file
vim.g.mapleader = ','

-- to avoid the extra 'shift' keypress when typing the colon
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true, silent = false })

-- cursor always in the center
vim.api.nvim_set_keymap('n', 'j', 'jzz', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', 'k', 'kzz', { noremap = true, silent = false })

-- completion option
vim.o.completeopt = 'menu,menuone,noselect'


-- ============================================================================
-- buffer
-- ============================================================================
-- set to auto read when a file is changed from the outside
vim.api.nvim_command('set autoread')
vim.api.nvim_command('au FocusGained,BufEnter * checktime')
vim.api.nvim_command('set guifont=Hack_Nerd_Font_Mono:h16')

-- return to last edit position when opening files (you want this!)
vim.cmd([[
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]])


-- ============================================================================
-- tab_and_indent
-- ============================================================================
-- use spaces instead of tabs
vim.o.expandtab = true
-- 1 tab == 4 spaces
vim.o.shiftwidth = 4
vim.o.tabstop = 4
-- be smart when using tabs ;)
vim.o.smarttab = true


-- ============================================================================
-- spell_checking
-- ============================================================================
-- spell-checking for EN and DE
vim.o.spelllang = 'en,de'
-- pressing ,ss will toggle and untoggle spell checking
vim.api.nvim_set_keymap('n', '<leader>ss', ':setlocal spell!<cr>',
    { noremap = true, silent = false })


-- ============================================================================
-- user_interface
-- ============================================================================
-- line number
vim.o.number = true
-- true color support
vim.o.termguicolors = true
-- always show current position
vim.o.ruler = true
-- show folding level
vim.o.foldcolumn = '1'
-- set 7 lines to the cursor - when moving vertically using j/k
vim.o.scrolloff = 7
-- always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
vim.o.signcolumn = 'yes'


-- ============================================================================
-- search
-- ============================================================================
-- when searching try to be smart about cases
vim.o.ignorecase = true
vim.o.smartcase = true
-- highlight search results
vim.o.hlsearch = true
-- makes search act like search in modern browsers
vim.o.incsearch = true
-- don't redraw while executing macros (good performance config)
vim.o.lazyredraw = true
-- for regular expressions turn magic on
vim.o.magic = true
