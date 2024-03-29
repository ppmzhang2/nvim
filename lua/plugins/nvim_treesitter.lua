require 'nvim-treesitter.configs'.setup {
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
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- default open all folds
vim.opt.foldlevel = 99
