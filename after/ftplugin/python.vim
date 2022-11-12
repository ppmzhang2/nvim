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

" run
noremap <buffer> <leader>r :Dispatch python %<cr>
