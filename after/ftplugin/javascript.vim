"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => helper function
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! JavaScriptFold()
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
setlocal foldmethod=syntax
setlocal foldlevelstart=1

call JavaScriptFold()

setlocal fen
setlocal nocindent

" shortcuts
imap <C-t> $log();<esc>hi
imap <C-a> alert();<esc>hi
inoremap <buffer> $r return
inoremap <buffer> $f // --- PH<esc>FP2xi
