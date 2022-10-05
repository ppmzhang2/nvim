# Julia LSP Settings

To install `LanguageServer.jl` into the current environment:

```julia
using Pkg
Pkg.add("LanguageServer")
```

Add to the Neovim configure files once the `nvim-lsconfig` is installed:

```lua
lspconfig.julials.setup {
    root_dir = lspconfig.util.root_pattern("Project.toml"),
    on_attach = on_attach,
    capabilities = capabilities,
}
```

Add to the `.ctags` for `tagbar` support:

```
--langdef=julia
--langmap=julia:.jl
--regex-julia=/^[ \t]*(([^ \t.({[]+\.)*@[^ \t({[]+[ \t]+)*(function|macro|abstract type|primitive type|struct|mutable struct|module)[ \t]+([^ \t({[]+).*$/\4/f,function/
--regex-julia=/^[ \t]*(([^ \t.({[]+\.)*@[^ \t({[]+[ \t]+)*(([^@#$ \t({[]+)|\(([^@#$ \t({[]+)\))[ \t]*[ \t]*\([^#]*\)([ \t]+where[ \t]+\{.*\})?[ \t]*=([^=].*)?$/\4\5/f,function/
--regex-julia=/^(([^ \t.({[]+\.)*@[^ \t({[]+[ \t]+)*(const[ \t]+)?(([^ \t.({[]+\.)*@[^ \t({[]+[ \t]+)*([^@#$ \t({[]+)[ \t]*=([^=].*)?$/\6/v,variable/
```
