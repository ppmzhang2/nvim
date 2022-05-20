# A Neovim Configuration

This is a unified Neovim configuration for all my devices, inspired by
[the ultimate vimrc](https://github.com/amix/vimrc).

## Prerequisites

- `tree-sitter`
- `fzf`
  - `fzf`
  - `ripgrep`
  - `the_silver_searcher`
- `tagbar`
  - `ctags`
- LSP
  - `llvm`
  - `lua-language-server`
  - `rust-analyzer`
  - `pyright` or `jedi-language-server` (setup guide can be found
    [here](./python_lsp_setup.md))
- linting
  - `clang-format`
  - `shellcheck` (linting)
  - `pylint`, `yapf`, `isort`

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

4. `PackerInstall` and `PackerCompile`

## Reference

1. https://github.com/amix/vimrc
2. https://github.com/rockerBOO/awesome-neovim
3. https://github.com/jszakmeister/markdown2ctags
4. https://github.com/jszakmeister/rst2ctags
