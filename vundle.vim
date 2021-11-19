set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tomasr/molokai'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'preservim/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'ervandew/supertab'
Plugin 'APZelos/blamer.nvim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'tpope/vim-dispatch'
Plugin 'cespare/vim-toml'
Plugin 'vim-scripts/LargeFile'
Plugin 'preservim/tagbar'
Plugin 'ryanoasis/vim-devicons'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Plugin 'altercation/vim-colors-solarized'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin configure
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
let g:tagbar_width = 30
let g:tagbar_left = 1
let g:tagbar_vertical = 0

" NERDTree
" 1. ignore machine codes
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
" 2. toggle sidebar and terminal
nnoremap <C-S>1 :CloseSideBars<CR> :NERDTreeFind<CR> :wincmd l<CR>
nnoremap <C-S>2 :CloseSideBars<CR> :Tagbar<CR>
nnoremap <C-S>c :CloseSideBars<CR>
nnoremap <C-W>t :below terminal<CR>
" 3. a narrow sidebar
let g:NERDTreeWinSize=20
" 4. minimal UI
let NERDTreeMinimalUI = 1
" 5. remove dir arrow to save space
let NERDTreeDirArrowExpandable=""
let NERDTreeDirArrowCollapsible=""

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
