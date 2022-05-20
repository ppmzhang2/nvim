" compile
noremap <buffer> <leader>c :Dispatch clang % -o %:r.out<CR>

" run
noremap <buffer> <leader>r :Dispatch ./%:r.out<CR>

" fix
noremap <buffer> <leader>f :Dispatch clang-format -i %<cr>
