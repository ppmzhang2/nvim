# A Neovim Configuration

This is a unified Neovim configuration inspired by [the ultimate
vimrc](https://github.com/amix/vimrc).

## Prerequisites

- `telescope` fuzzy finder
  - `ripgrep`
- `tagbar`
  - `ctags`
- LSP
  - `llvm`
  - `lua-language-server`
  - `rust-analyzer`
  - `pyright`
- linting
  - `shellcheck`
  - `ruff`
- formatter
  - `clang-format`
  - `yapf`
  - `prettier`

## Installation

1. Clone the configuration files to folder `~/.config`:

   ```sh
   rm -rf ~/.config/nvim
   git clone https://github.com/ppmzhang2/nvim.git ~/.config/nvim
   ```

2. Set up `packer.vim`:

   ```sh
   git clone --depth 1 https://github.com/wbthomason/packer.nvim \
   ~/.local/share/nvim/site/pack/packer/start/packer.nvim
   ```

3. `PackerInstall` and `PackerCompile`

## LSP Setup

- [python](./python_lsp_setup.md)
- [ocaml](./ocaml_lsp_setup.md)
- [julia](./julia_lsp_setup.md)
- [.NET (C# / F#)](./dotnet_lsp_setup.md)

## Reference

1. https://github.com/amix/vimrc
2. https://github.com/rockerBOO/awesome-neovim
3. https://github.com/jszakmeister/markdown2ctags
4. https://github.com/jszakmeister/rst2ctags
