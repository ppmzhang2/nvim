" cmd
noremap <buffer> <leader>c :Dispatch csc %<CR>
noremap <buffer> <leader>r :Dispatch mono %:r.exe<CR>

" ale
" Fix c# files with clang-format
let b:ale_fixers = ['clang-format']
