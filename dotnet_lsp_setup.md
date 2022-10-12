# .NET (C# / F#) LSP Settings

To install `csharp-ls` and `fsautocomplete` with `dotnet`:

```bash
dotnet tool install --global csharp-ls
dotnet tool install --global fsautocomplete
```

Add to the Neovim configure files once the `nvim-lsconfig` is installed:

```lua
require 'lspconfig'.csharp_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
require 'lspconfig'.fsautocomplete.setup {
    root_dir = lspconfig.util.root_pattern("*.csproj"),
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "fsautocomplete", "--background-service-enabled" },
}
```

## TODO

Syntax highlighting and the LSP configuration for `F#` is still invalid.
