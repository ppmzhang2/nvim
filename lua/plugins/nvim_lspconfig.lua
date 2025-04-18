-- ============================================================================
-- reference
-- 1. https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
-- 2. https://github.com/hrsh7th/nvim-cmp
-- ============================================================================

-- Mappings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
local keymap = function(lhs, rhs)
    return vim.api.nvim_set_keymap('n', lhs, rhs, opts)
end

keymap('<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
keymap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
keymap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
keymap('<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')

local function lsp_keymaps(bufnr)
    local buf_keymap = function(lhs, rhs)
        return vim.api.nvim_buf_set_keymap(bufnr, 'n', lhs, rhs, opts)
    end
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
    buf_keymap('<space>f', '<cmd>lua vim.lsp.buf.format{async=true}<CR>')
    buf_keymap('<space>wr',
        '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
    buf_keymap('<space>wl',
        '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
end

-- use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
    lsp_keymaps(bufnr)
end

local lspconfig = require('lspconfig')
-- add additional capabilities supported by nvim-cmp
local cap = vim.lsp.protocol.make_client_capabilities()
cap = require('cmp_nvim_lsp').default_capabilities(cap)
cap.textDocument.semanticHighlighting = true
cap.offsetEncoding = "utf-8"

-- lspconfig.jedi_language_server.setup {
--     on_attach = on_attach,
--     capabilities = cap,
--     cmd = { "jedi-language-server" },
--     init_options = {
--         completion = {
--             enable = false,
--             disable = true,
--             -- disable_snippets = true,
--             resolve_eagerly = false,
--         },
--         diagnostics = {
--             enable = false,
--         },
--         hover = {
--             enable = true,
--         },
--         workspace = {
--             extraPaths = {
--                 "./__pypackages__/3.10/lib",
--                 "./__pypackages__/3.11/lib",
--                 "./__pypackages__/3.12/lib",
--                 "./src",
--             },
--             symbols = {
--                 ignoreFolders = { "__pypackages__", "__pycache__", "venv" },
--                 maxSymbols = 20
--             }
--         }
--     }
-- }

lspconfig.pyright.setup {
    on_attach = on_attach,
    capabilities = cap,
    -- disable linting
    settings = {
        python = {
            analysis = {
                diagnosticMode = "workspace",
                autoSearchPaths = true,
                useLibraryCodeForTypes = false,
                diagnosticSeverityOverrides = {
                    reportUnusedImport = "none",
                    reportUndefinedVariable = "none",
                    reportUndefinedFunction = "none",
                    reportUndefinedMethod = "none",
                    reportUndefinedClass = "none",
                    reportUndefinedModule = "none",
                    reportUndefinedMember = "none",
                    reportUndefinedParameter = "none",
                    reportUndefinedType = "none",
                    reportMissingModule = "none",
                    reportMissingImports = "none",
                    reportMissingTypeHint = "none",
                },
            },
        },
    },
}

-- lspconfig.dartls.setup {
--     on_attach = on_attach,
--     capabilities = cap,
--     cmd = { "dart", "language-server", "--protocol=lsp" },
--     init_options = {
--         onlyAnalyzeProjectsWithOpenFiles = "true",
--         suggestFromUnimportedLibraries = "true",
--         closingLabels = "true",
--         outline = "true",
--         fluttreOutline = "true",
--     },
-- }

lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = cap,
    cmd = { "clangd" },
}

lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = cap,
}

lspconfig.ts_ls.setup {
    on_attach = on_attach,
    capabilities = cap,
}

lspconfig.html.setup {
    on_attach = on_attach,
    capabilities = cap,
    cmd = { "html-languageserver", "--stdio" },
}

lspconfig.cssls.setup {
    on_attach = on_attach,
    capabilities = cap,
    cmd = { "css-languageserver", "--stdio" },
}

-- lspconfig.julials.setup {
--     root_dir = lspconfig.util.root_pattern("Project.toml"),
--     on_attach = on_attach,
--     capabilities = cap,
--     cmd = { "julia",
--         "--startup-file=no",
--         "--history-file=no",
--         "-e",
--         'using LanguageServer\n' ..
--         'depot_path = joinpath(homedir(), ".julia")\n' ..
--         'project_path = pwd()\n' ..
--         '@info "Running language server" ' ..
--         '    VERSION pwd() project_path depot_path\n' ..
--         'server = LanguageServer.LanguageServerInstance(' ..
--         '    stdin, stdout, project_path, depot_path)\n' ..
--         'server.runlinter = true\n' ..
--         'run(server)\n',
--     },
-- }

lspconfig.ocamllsp.setup {
    -- root_dir = lspconfig.util.root_pattern("*.opam",
    --     "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
    root_dir = lspconfig.util.root_pattern(".ocamlformat"),
    on_attach = on_attach,
    capabilities = cap,
}

lspconfig.csharp_ls.setup {
    root_dir = lspconfig.util.root_pattern("*.csproj"),
    on_attach = on_attach,
    capabilities = cap,
    -- cmd = { "csharp-ls" },
    init_options = {
        AutomaticWorkspaceInit = true,
        displayLspServerName = true,
        maxNumberOfProblems = 100,
        showReferencesCodeLens = true,
    },
}

lspconfig.fsautocomplete.setup {
    root_dir = lspconfig.util.root_pattern("*.csproj"),
    on_attach = on_attach,
    capabilities = cap,
    cmd = { "fsautocomplete", "--background-service-enabled" },
}

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = cap,
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

vim.cmd([[
let g:copilot_filetypes = {
    \ 'gitcommit': v:true,
    \ 'markdown': v:true,
    \ 'yaml': v:true
    \ }
]])
