" compile
noremap <buffer> <leader>c :Dispatch clang++ -std=c++20 -o %:r.out %<CR>

" run
noremap <buffer> <leader>r :Dispatch ./%:r.out<CR>

" format
nnoremap <buffer> <leader>f :silent %!clang-format<CR>
