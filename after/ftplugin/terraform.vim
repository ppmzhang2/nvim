" don't fix terraform files with ALE
let b:ale_fixers = []

" format with vim-terraform
noremap <buffer> <leader>f :TerraformFmt<cr>
