" compile
noremap <buffer> <leader>c :Dispatch clang++ -std=c++20 -o %:r.out %<CR>

" run
noremap <buffer> <leader>r :Dispatch ./%:r.out<CR>
