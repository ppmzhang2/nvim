"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install plugs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tomasr/molokai'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'preservim/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'ervandew/supertab'
Plug 'APZelos/blamer.nvim'
Plug 'tpope/vim-dispatch'
Plug 'cespare/vim-toml'
Plug 'vim-scripts/LargeFile'
Plug 'preservim/tagbar'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ycm-core/YouCompleteMe'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => plugin configure
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" tagbar
" 1. width
let g:tagbar_width = 25
let g:tagbar_left = 1
let g:tagbar_vertical = 0

" NERDTree
" 1. ignore machine codes
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
" 2. toggle sidebar and terminal
nnoremap <C-S>q :CloseSideBars<CR> :NERDTreeFind<CR> :wincmd l<CR>
nnoremap <C-S>w :CloseSideBars<CR> :Tagbar<CR>
nnoremap <C-S>c :CloseSideBars<CR>
nnoremap <C-W>t :below terminal<CR>
" 3. a narrow sidebar
let g:NERDTreeWinSize = 25
" 4. minimal UI
let NERDTreeMinimalUI = 1
" 5. remove dir arrow to save space
let NERDTreeDirArrowExpandable = ""
let NERDTreeDirArrowCollapsible = ""

" blamer.nvim
" 1. enable
let g:blamer_enabled = 1
" 2. hide in insert modes
let g:blamer_show_in_insert_modes = 0

" syntastic
" 1. python checkers
let g:syntastic_python_checkers = ['pylint']
" 2. passive mod
let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": [],
    \ "passive_filetypes": [] }
" 3. manual check shortcut
nnoremap <C-w>e :SyntasticCheck<cr>

" ycm
" 1. enable on listed file types
let g:ycm_filetype_whitelist = {
    \ "c":1,
    \ "cpp":1,
    \ "objc":1,
    \ "sh":1,
    \ "zsh":1,
    \ "zimbu":1,
    \ "python":1,
    \ }
" 2. clang support: use installed clang and give fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_clangd_binary_path = "/opt/homebrew/opt/llvm/bin/clangd"

" vim-devicons
let g:webdevicons_enable_nerdtree = 1
let g:airline_powerline_fonts = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:CloseSideBars()
    TagbarClose
    NERDTreeClose
endfunction
command! -nargs=0 CloseSideBars :call s:CloseSideBars()
