" cmd
noremap <buffer> <leader>f :Dispatch clang-format -i %<cr>
noremap <buffer> <leader>c :Dispatch clang % -o %.out<cr>
map <buffer> K <plug>(YCMHover)
