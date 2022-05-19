vim.cmd([[
" - keep tags' order they have in the source file
let g:tagbar_sort = 0
" - width
let g:tagbar_width = 25
" - top-left
let g:tagbar_left = 1
let g:tagbar_vertical = 0
]])

vim.api.nvim_set_keymap('n', '<C-S>w', ':TagbarToggle<cr>', {
    noremap = true,
    silent = false,
})
