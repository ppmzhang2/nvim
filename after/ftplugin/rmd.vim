" Add support for markdown files in tagbar.
let g:tagbar_type_rmd = {
    \ 'ctagstype': 'rmd',
    \ 'ctagsbin' : '~/.config/nvim/bin/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes --sro=»',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '»',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }
