# OCaml LSP Settings

## OCaml Environment

First install `ocaml` and the package manager `opam`. Then install packages
with `opam`:

```bash
opam install utop ocaml-lsp-server ocamlformat
```

## LSP Configuration

Add to the Neovim configure files once the `nvim-lsconfig` is installed:

```lua
require 'lspconfig'.ocamllsp.setup {
    root_dir = lspconfig.util.root_pattern(".ocamlformat"),
    on_attach = on_attach,
    capabilities = capabilities,
}
```

For project root path detection, create a `OCaml` formatting configuration file
`.ocamlformat`.
