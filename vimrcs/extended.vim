" =============================================================================
" => GUI related
" =============================================================================
" Set font according to system
if has("mac") || has("macunix")
    set gfn=Hack_Nerd_Font_Mono:h20,Menlo:h20
elseif has("win16") || has("win32")
    set gfn=Bitstream_Vera_Sans_Mono:h20,IBM_Plex_Mono:h20
    set gfw=Microsoft_Yahei_20,WenQuanYi_Zen_Hei_20
elseif has("gui_gtk2") || has("gui_gtk3")
    set gfn=Bitstream_Vera_Sans_Mono_20,Fixed_20
elseif has("linux")
    set gfn=Bitstream_Vera_Sans_Mono_20
elseif has("unix")
    set gfn=Monospace_20
endif


" =============================================================================
" => TBD Fast editing and reloading of vimrc configs
" =============================================================================
" map <leader>e :e! ~/.vim/vimrcs/*.vim<cr>
" autocmd! bufwritepost ~/.vim/vimrcs/*.vim source ~/.vim/vimrcs/*.vim


" =============================================================================
" => Command mode related
" =============================================================================
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
" it deletes everything until the last slash
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Map ½ to something useful
map ½ $
cmap ½ $
imap ½ $


" =============================================================================
" => Parenthesis/bracket
" =============================================================================
" vnoremap $1 <esc>`>a)<esc>`<i(<esc>
" vnoremap $2 <esc>`>a]<esc>`<i[<esc>
" vnoremap $3 <esc>`>a}<esc>`<i{<esc>
" vnoremap $$ <esc>`>a"<esc>`<i"<esc>
" vnoremap $q <esc>`>a'<esc>`<i'<esc>
" vnoremap $e <esc>`>a"<esc>`<i"<esc>
"
" " Map auto complete of (, ", ', [
" inoremap $1 ()<esc>i
" inoremap $2 []<esc>i
" inoremap $3 {}<esc>i
" inoremap $4 {<esc>o}<esc>O
" inoremap $q ''<esc>i
" inoremap $e ""<esc>i


" =============================================================================
" => General abbreviations
" =============================================================================
iab xdate <C-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


" =============================================================================
" => Omni complete functions
" =============================================================================
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


" =============================================================================
" => Helper functions
" =============================================================================
func! DeleteTillSlash()
    let g:cmd = getcmdline()

    if has("win16") || has("win32")
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    endif

    if g:cmd == g:cmd_edited
        if has("win16") || has("win32")
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
        endif
    endif

    return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc
