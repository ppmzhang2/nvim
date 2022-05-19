-- ============================================================================
-- general_setting
-- ============================================================================
-- 4s delay is too much
-- used by YCM hover, nerdtree-git-plugin, etc.
vim.opt.updatetime = 100

-- how many lines of history VIM has to remember
vim.g.history = 500

-- With a map leader it's possible to do extra key combinations
-- like <leader>w saves the current file
vim.g.mapleader = ','

-- set to auto read when a file is changed from the outside
vim.api.nvim_command('set autoread')
vim.api.nvim_command('au FocusGained,BufEnter * checktime')

-- to avoid the extra 'shift' keypress when typing the colon
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true, silent = false })

-- cursor always in the center
vim.api.nvim_set_keymap('n', 'j', 'jzz', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', 'k', 'kzz', { noremap = true, silent = false })

-- ============================================================================
-- user_interface
-- ============================================================================
vim.api.nvim_command('set number')
-- always show current position
vim.api.nvim_command('set ruler')
-- add a bit extra margin to the left
vim.api.nvim_command('set foldcolumn=1')
-- set 7 lines to the cursor - when moving vertically using j/k
vim.api.nvim_command('set so=7')

-- search
vim.cmd([[
  set ignorecase
  " when searching try to be smart about cases
  set smartcase
  " highlight search results
  set hlsearch
  " makes search act like search in modern browsers
  set incsearch
  " don't redraw while executing macros (good performance config)
  set lazyredraw
  " for regular expressions turn magic on
  set magic
]])

-- return to last edit position when opening files (you want this!)
vim.cmd([[
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]])
