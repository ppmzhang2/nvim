"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => helper function
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ConfigPath()
    " environment variable do NOT support wildcards
    let $PYTHONPATH = "./__pypackages__/3.9/lib:" . $PYTHONPATH
    let $PYTHONPATH = "./__pypackages__/3.10/lib:" . $PYTHONPATH
    let $PATH = './__pypackages__/3.9/bin:' . $PATH
    let $PATH = './__pypackages__/3.10/bin:' . $PATH
endfunction

" use PEP582 style local package
call ConfigPath()

" folding
setlocal foldmethod=indent
setlocal foldnestmax=2

" default open all folds
setlocal foldlevel=99

" run
noremap <buffer> <leader>r :Dispatch python %<cr>
" fixer
noremap <buffer> <leader>f :Dispatch isort %<cr> :Dispatch yapf -i %<cr>
