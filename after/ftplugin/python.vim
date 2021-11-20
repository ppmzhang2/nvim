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
noremap <buffer> <leader>f :Dispatch yapf -i %<cr>
noremap <buffer> <leader>s :Dispatch isort %<cr>
noremap <buffer> K :Dispatch python -m pydoc <cword><cr>
