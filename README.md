# The Vim Configuration

This is a unified Vim configuration for all my devices, inspired by [the ultimate vimrc](https://github.com/amix/vimrc).

## Install

Prerequisites:

- `vim-devicons`
  - [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts#font-installation) to avoid break
- `YouCompleteMe`
  - `llvm` for `clang` support
  - `clang-format` for c / cpp formatting
- `fzf`
  - `fzf` for `:FZF`
  - `ripgrep` for `:Rg`
  - `the_silver_searcher` for `:Ag`

1. Clone the configuration files to folder `~/.vim`:

   `rm -rf ~/.vim && git clone https://github.com/ppmzhang2/vimrc.git ~/.vim`


2. Set up `vim-plug`:

   ```sh
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

3. Edit `~/.vimrc` to include them:

    ```vim
    source ~/.vim/vimrcs/basic.vim
    source ~/.vim/vimrcs/plug.vim
    source ~/.vim/vimrcs/langs.vim
    source ~/.vim/vimrcs/extended.vim
    ```

4. Update plugins.
5. Install **YouCompleteMe** compilers from [instruction](https://github.com/ycm-core/YouCompleteMe#installation):
   - install dependency:

    ```sh
    brew install llvm cmake go python macvim
    ```

   - install compilers:

    ```sh
    cd ~/.vim/plugged/YouCompleteMe
    ./install.py --cs-completer --go-completer --rust-completer --clangd-completer
    ```
