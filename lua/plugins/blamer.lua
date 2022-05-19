vim.cmd([[
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
]])
