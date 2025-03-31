"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => helper function
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! ConfigPath()
"     " environment variable do NOT support wildcards
"     let $PYTHONPATH = "./__pypackages__/3.9/lib:" . $PYTHONPATH
"     let $PYTHONPATH = "./__pypackages__/3.10/lib:" . $PYTHONPATH
"     let $PATH = './__pypackages__/3.9/bin:' . $PATH
"     let $PATH = './__pypackages__/3.10/bin:' . $PATH
" endfunction
"
" " use PEP582 style local package
" call ConfigPath()

" run
nnoremap <buffer> <leader>r :Dispatch python %<cr>

" lint with ruff
nnoremap <buffer> <leader>e :silent !ruff check % --fix --silent<cr>

" format with yapf
nnoremap <buffer> <leader>f :silent !yapf --in-place %<cr>
