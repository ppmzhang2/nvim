# The Vim Configuration

This is a unified Vim configuration for all my devices, inspired by [the ultimate vimrc](https://github.com/amix/vimrc) and [Vundle](https://github.com/VundleVim/Vundle.vim).

## Install

Prerequisites:

- `vim-devicons`
  - [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts#font-installation) to avoid break
- `YouCompleteMe`
  - `llvm` for `clang` support
  - `clang-format` for c / cpp formatting

1. Set up Vundle:

   `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

2. Clone the configuration files to folder `~/.vim`:

   `rm -rf ~/.vim/vimrcs && git clone https://github.com/ppmzhang2/vimrc.git ~/.vim/vimrcs`

3. Edit `~/.vimrc` to include them:

    ```vim
    source ~/.vim/vimrcs/vundle.vim
    source ~/.vim/vimrcs/basic.vim
    source ~/.vim/vimrcs/filetypes.vim
    source ~/.vim/vimrcs/extended.vim
    ```

4. Update plugins.
5. Install **YouCompleteMe**
   - [instruction](https://github.com/ycm-core/YouCompleteMe#installation)
