" folding
setlocal foldmethod=indent
setlocal foldnestmax=2

" default open all folds
setlocal foldlevel=99

" shortcuts
inoremap <buffer> $r return
inoremap <buffer> $i import
inoremap <buffer> $p print
inoremap <buffer> $f # --- <esc>a

" cmd
noremap <buffer> <leader>r :Dispatch python %<cr>

" ale
" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8', 'pylint']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['yapf', 'black', 'isort']
