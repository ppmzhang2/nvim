vim.pack.add({
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        version = "main",
    },
})

require("nvim-treesitter.configs").setup({
    -- A list of parser names, or "all"
    ensure_installed = { "fish", "bash", "c", "cpp", "lua", "markdown", "python",
        "rst", "rust", "javascript", "typescript", "html", "css", "json", },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI
    -- installed locally
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    ignore_install = { "" },

    modules = {
        -- TODO: add more languages
    },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for
        -- example if you want to disable highlighting for the `tex` filetype,
        -- you need to include `latex` in this list as this is the name of the
        -- parser)
        -- list of language that will be disabled
        disable = { "" },

        -- Setting this to true will run `:h syntax` and tree-sitter at the
        -- same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like
        -- for indentation).
        -- Using this option may slow down your editor, and you may see some
        -- duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
})

vim.api.nvim_create_autocmd('PackChanged', {
    desc = 'Handle nvim-treesitter updates',
    group = vim.api.nvim_create_augroup('nvim-treesitter-pack-changed-update-handler', { clear = true }),
    callback = function(event)
        if event.data.kind == 'update' and event.data.spec.name == 'nvim-treesitter' then
            vim.notify('nvim-treesitter updated, running TSUpdate...', vim.log.levels.INFO)
            ---@diagnostic disable-next-line: param-type-mismatch
            local ok = pcall(vim.cmd, 'TSUpdate')
            if ok then
                vim.notify('TSUpdate completed successfully!', vim.log.levels.INFO)
            else
                vim.notify('TSUpdate command not available yet, skipping', vim.log.levels.WARN)
            end
        end
    end,
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- default open all folds
vim.opt.foldlevel = 99
