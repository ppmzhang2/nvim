vim.cmd([[
" - for linting and fixing only
let g:ale_completion_enabled = 0
" - warning list window setting
let g:ale_open_list = 0
let g:ale_list_window_size = 5
" - manually but instantly
let g:ale_lint_delay = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
" show warning in airline status bar
let g:airline#extensions#ale#enabled = 1
" - shortcuts
nnoremap <C-W>e :ALELint<CR>
nnoremap <leader>f :ALEFix<CR>
]])
