" compile
noremap <buffer> <leader>c :Dispatch clang % -o %:r.out<CR>

" run
noremap <buffer> <leader>r :Dispatch ./%:r.out<CR>
