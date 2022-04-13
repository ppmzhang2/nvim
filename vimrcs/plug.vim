" ============================================================================
" => install plugs
" ============================================================================
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'godlygeek/tabular'
Plug 'ervandew/supertab'
Plug 'tpope/vim-dispatch'
Plug 'preservim/tagbar'
" " syntax
Plug 'ycm-core/YouCompleteMe'
Plug 'dense-analysis/ale'
" " git
Plug 'tpope/vim-fugitive'
Plug 'APZelos/blamer.nvim'
Plug 'Xuyuanp/nerdtree-git-plugin'
" " fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
" " file spec
Plug 'vim-scripts/LargeFile'
Plug 'cespare/vim-toml'
Plug 'plasticboy/vim-markdown'
Plug 'dhruvasagar/vim-table-mode'
" " UI
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'tomasr/molokai'
Plug 'AlessandroYorba/Sierra'
Plug 'morhetz/gruvbox'  " STAR
Plug 'hashivim/vim-terraform'
call plug#end()


" ============================================================================
" => plugin configure
" ============================================================================
" colorscheme
" - background
set background=dark
" - molokai
" let g:molokai_original = 1  " original
" let g:rehash256 = 1  " 256 color version
" colorscheme molokai
" - sierra
" let g:sierra_Sunset = 1  " dark grey
" let g:sierra_Twilight = 1  " even darker grey
" let g:sierra_Midnight = 1  " almost black
" colorscheme sierra
" - gruvbox
colorscheme gruvbox

" nerdtree-git-plugin
" - customizable icons
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
" - keep tags' order they have in the source file
let g:tagbar_sort = 0
" - width
let g:tagbar_width = 25
" - top-left
let g:tagbar_left = 1
let g:tagbar_vertical = 0

" NERDTree
" - ignore machine codes
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
" - show hidden files e.g. .gitignore
let NERDTreeShowHidden = 1
" - toggle sidebar and terminal
nnoremap <C-S>q :CloseSideBars<CR> :NERDTreeFind<CR> :wincmd l<CR>
nnoremap <C-S>w :CloseSideBars<CR> :Tagbar<CR>
nnoremap <C-S>c :CloseSideBars<CR>
nnoremap <C-S>t :belowright terminal<CR>
nnoremap <C-S>g :belowright Git!<CR>
" - a narrow sidebar
let g:NERDTreeWinSize = 25
" - minimal UI
let NERDTreeMinimalUI = 1
" - remove dir arrow to save space
let NERDTreeDirArrowExpandable = ""
let NERDTreeDirArrowCollapsible = ""

" blamer.nvim
" - enable
let g:blamer_enabled = 1
" - hide in insert modes
let g:blamer_show_in_insert_modes = 0
" - 1s is too much
let g:blamer_delay = 500
" - prefix
let g:blamer_prefix = ' '
" - template
let g:blamer_template = '[<committer>] <committer-time>: <summary>'
" - use relative time
let g:blamer_relative_time = 1

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" ale
" - for linting and fixing only
let g:ale_completion_enabled = 0
" - warning list window setting
let g:ale_open_list = 0
let g:ale_list_window_size = 5
" - manually but instantly
let g:ale_lint_delay = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
" show warning in airline status bar
let g:airline#extensions#ale#enabled = 1
" - shortcuts
nnoremap <C-W>e :ALELint<CR>
nnoremap <leader>f :ALEFix<CR>

" ycm
" - enable on listed file types
let g:ycm_filetype_whitelist = {
    \ "c":1,
    \ "cpp":1,
    \ "cs": 1,
    \ "objc":1,
    \ "sh":1,
    \ "zsh":1,
    \ "zimbu":1,
    \ "python":1,
    \ }
" - clang support: use installed clang and give fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_clangd_binary_path = "/opt/homebrew/opt/llvm/bin/clangd"
" - GetDoc manually
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
" - manual toggle instead of auto display as the sign column may
" - be occupied by ale / syntastic
let g:gitgutter_enabled = 0

" " Ack: searching and cope displaying
" "    requires ack.vim - it's much better than vimgrep/grep
" " - Use the the_silver_searcher if possible (much faster than Ack)
" if executable('ag')
"   let g:ackprg = 'ag --vimgrep --smart-case'
" endif
" " - When you press gv you Ack after the selected text
" vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
" " - Open Ack and put the cursor in the right position
" map <leader>g :Ack
" " - When you press <leader>r you can search and replace the selected text
" vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>
" " - Do :help cope if you are unsure what cope is. It's super useful!
" " - When you search with Ack, display your results in cope by doing:
" "     <leader>cc
" "   To go to the next search result do:
" "     <leader>n
" "   To go to the previous search results do:
" "     <leader>p
" map <leader>cc :botright cope<cr>
" map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
" map <leader>n :cn<cr>
" map <leader>p :cp<cr>
" " - Make sure that enter is never overriden in the quickfix window
" autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>


" ============================================================================
" => helper functions
" ============================================================================
function! s:CloseSideBars()
    TagbarClose
    NERDTreeClose
endfunction
command! -nargs=0 CloseSideBars :call s:CloseSideBars()
