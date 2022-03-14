"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => helper function
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ConfigPath()
    " environment variable do NOT support wildcards
    let $PYTHONPATH = "./__pypackages__/3.7/lib:" . $PYTHONPATH
    let $PYTHONPATH = "./__pypackages__/3.8/lib:" . $PYTHONPATH
    let $PYTHONPATH = "./__pypackages__/3.9/lib:" . $PYTHONPATH
    let $PYTHONPATH = "./__pypackages__/3.10/lib:" . $PYTHONPATH
    let $PATH = './__pypackages__/3.7/bin:' . $PATH
    let $PATH = './__pypackages__/3.8/bin:' . $PATH
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

" shortcuts
inoremap <buffer> $r return
inoremap <buffer> $i import
inoremap <buffer> $p print
inoremap <buffer> $f # --- <esc>a

" run
noremap <buffer> <leader>r :Dispatch python %<cr>

" sort importation
noremap <buffer> <leader>s :Dispatch isort %<cr>

" ale
" Check Python files with flake8 and pylint.
let b:ale_linters = ['pylint']
" Fix Python files with autopep8 and yapf.
" can only accept one fixer for PEP 582 packages
let b:ale_fixers = ['yapf']
