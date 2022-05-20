# Python LSP Settings

## Pyright

Add to the Neovim configure files once the `nvim-lsconfig` is installed:

```lua
require 'lspconfig'.pyright.setup {}
```

For a PEP 582 project with a local package directory, add to the root path a
JSON configuration `pyrightconfig.json`
([reference](https://github.com/microsoft/pyright/blob/main/docs/configuration.md)):

```json
{
    "pythonVersion": "3.10",
    "exclude": ["**/node_modules", "**/__pycache__", "**/__pypackages__"],
    "ignore": ["**/node_modules", "**/__pycache__", "**/__pypackages__"],
    "extraPaths": [ "./__pypackages__/3.10/lib" ]
}
```

Pyright settings for `nvim-lspconfig`
([reference](https://github.com/microsoft/pyright/blob/main/docs/settings.md)):

```lua
require 'lspconfig'.pyright.setup {
    python = {
        analysis = {
            diagnosticMode = "workspace",
            extraPaths = { "" }
        }
    }
}
```

## Jedi

**Local package directory within the root path may result in unexpected
actions.**

A sample setup with initialization options inspired by
[the document](https://github.com/pappasam/jedi-language-server#configuration):

```lua
require 'lspconfig'.jedi_language_server.setup {
    cmd = { "jedi-language-server" },
    init_options = {
        diagnostics = {
            enable = false,
        },
        hover = {
            enable = true,
        },
        workspace = {
            extraPaths = {
                "./__pypackages__/3.10/lib"
            },
            symbols = {
                ignoreFolders = { "__pypackages__", "__pycache__", "venv" },
                maxSymbols = 20
            }
        }
    }
}
```
