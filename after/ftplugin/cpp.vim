" cmd
noremap <buffer> <leader>c :Dispatch clang++ -std=c++17 -o %:r.out %<CR>
noremap <buffer> <leader>r :Dispatch ./%:r.out<CR>

" ale
" Fix c / c++ files with clang-format
let b:ale_fixers = ['clang-format']
