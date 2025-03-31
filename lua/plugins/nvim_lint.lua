-- unused configuration, use null-ls instead
require('lint').linters_by_ft = {
    python = { 'ruff' },
    sh = { 'shellcheck' },
    bash = { 'shellcheck' },
}

-- Run linters manually
vim.api.nvim_set_keymap(
    'n',
    '<C-W>e',
    ':lua require("lint").try_lint()<CR>',
    { noremap = true, silent = false }
)

-- Run linters on save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        -- try_lint without arguments runs the linters defined in `linters_by_ft`
        -- for the current filetype
        require("lint").try_lint()
    end,
})

-- Run linters on (re)entering a buffer or (re)opening a file
vim.api.nvim_create_autocmd({ "BufEnter", "BufReadPost" }, {
    callback = function()
        -- try_lint without arguments runs the linters defined in `linters_by_ft`
        -- for the current filetype
        require("lint").try_lint()
    end,
})
