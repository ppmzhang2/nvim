"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install plugs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'godlygeek/tabular'
Plug 'ervandew/supertab'
Plug 'tpope/vim-dispatch'
Plug 'preservim/tagbar'
" syntax
Plug 'ycm-core/YouCompleteMe'
Plug 'dense-analysis/ale'
" git
Plug 'tpope/vim-fugitive'
Plug 'APZelos/blamer.nvim'
Plug 'Xuyuanp/nerdtree-git-plugin'
" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
" file spec
Plug 'vim-scripts/LargeFile'
Plug 'cespare/vim-toml'
Plug 'plasticboy/vim-markdown'
" UI
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'tomasr/molokai'
Plug 'AlessandroYorba/Sierra'
Plug 'morhetz/gruvbox'  " STAR
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => plugin configure
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme
" background
set background=dark
" " - molokai
" let g:molokai_original = 1  " original
" let g:rehash256 = 1  " 256 color version
" colorscheme molokai
" " - sierra
" let g:sierra_Sunset = 1  " dark grey
" let g:sierra_Twilight = 1  " even darker grey
" let g:sierra_Midnight = 1  " almost black
" colorscheme sierra
" " - gruvbox
colorscheme gruvbox

" nerdtree-git-plugin
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
nnoremap <C-S>t :belowright terminal<CR>
nnoremap <C-S>g :belowright Git<CR><C-W>5-
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
" 3. 1s is too much
let g:blamer_delay = 500
" 4. prefix
let g:blamer_prefix = ' '
" 5. template
let g:blamer_template = '[<committer>] <committer-time>: <summary>'
" 6. use relative time
let g:blamer_relative_time = 1

" ale
" ale for linting and fixing only
let g:ale_completion_enabled = 0
" ale warning list window setting
let g:ale_open_list = 1
let g:ale_list_window_size = 5
" manually but instantly
let g:ale_lint_delay = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
nnoremap <C-W>e :ALELint<CR>
nnoremap <C-W>f :ALEFix<CR>
nnoremap <leader>f :ALEFix<CR>

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
" 3. GetDoc manually
let g:ycm_auto_hover = ''
augroup YcmCustomHover
  autocmd!
  autocmd FileType c,cpp let b:ycm_hover = {
    \ 'command': 'GetDoc',
    \ 'syntax': &filetype
    \ }
augroup END
nmap K <plug>(YCMHover)

" vim-devicons
let g:webdevicons_enable_nerdtree = 1
let g:airline_powerline_fonts = 1

" vim-gitgutter
" manual toggle instead of auto display as the sign column may
" be occupied by ale / syntastic
let g:gitgutter_enabled = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:CloseSideBars()
    TagbarClose
    NERDTreeClose
endfunction
command! -nargs=0 CloseSideBars :call s:CloseSideBars()
