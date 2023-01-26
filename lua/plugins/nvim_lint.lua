-- unused configuration, use null-ls instead
require('lint').linters_by_ft = {
    python = { 'pylint' },
    sh = { 'shellcheck' },
    bash = { 'shellcheck' },
}

vim.api.nvim_set_keymap(
    'n',
    '<C-W>e',
    ':lua require("lint").try_lint()<CR>',
    { noremap = true, silent = false }
)
