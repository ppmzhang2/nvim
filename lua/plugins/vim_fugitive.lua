vim.pack.add({ "https://github.com/tpope/vim-fugitive.git" })
vim.api.nvim_set_keymap('n', '<C-S>g', ':belowright Git!<cr>', {
    noremap = true,
    silent = false,
})
