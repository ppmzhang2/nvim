vim.opt.shell = "/bin/bash"

require('core.basic')
-- ui
require('plugins.ui')
require('plugins.nvim_dispatch')
require('plugins.nvim_web_devicons')
require('plugins.lualine')
require('plugins.nvim_tree')
require('plugins.tagbar')
-- git
require('plugins.vim_fugitive')
require('plugins.blamer')
-- lsp
require('plugins.nvim_cmp')
require('plugins.nvim_lspconfig')
require('plugins.nvim_lint')
require('plugins.nvim_treesitter')
require('plugins.vim_tabby')
-- misc
require('plugins.telescope')
require('plugins.mini')
