-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
local keymap = function(lhs, rhs)
    return vim.api.nvim_set_keymap('n', lhs, rhs, opts)
end

keymap('<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
keymap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
keymap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
keymap('<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
    local buf_keymap = function(lhs, rhs)
        return vim.api.nvim_buf_set_keymap(bufnr, 'n', lhs, rhs, opts)
    end

    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_keymap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    buf_keymap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    buf_keymap('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    buf_keymap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    buf_keymap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    buf_keymap('<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
    buf_keymap('<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    buf_keymap('<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    buf_keymap('<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    buf_keymap('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    buf_keymap('<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
    buf_keymap('<space>wr',
        '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
    buf_keymap('<space>wl',
        '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
end

require 'lspconfig'.jedi_language_server.setup {
    on_attach = on_attach,
    cmd = { "jedi-language-server" },
}

require 'lspconfig'.clangd.setup {
    on_attach = on_attach,
    cmd = { "/opt/homebrew/opt/llvm/bin/clangd" },
}

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require 'lspconfig'.sumneko_lua.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique
            -- identifier
            telemetry = {
                enable = false,
            },
        },
    },
}
