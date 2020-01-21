# The Vim Configuration

This is a unified Vim configuration for all my devices, inspired by [the ultimate vimrc](https://github.com/amix/vimrc) and [Vundle](https://github.com/VundleVim/Vundle.vim).

## Install

Clone the configuration files to folder `.vim`:

```sh
git clone https://github.com/ppmzhang2/vimrc.git ~/.vim
```

Edit `~/.vimrc` to include them:

```vim
source ~/.vim/vimrcs/vundle.vim
source ~/.vim/vimrcs/basic.vim
source ~/.vim/vimrcs/filetypes.vim
source ~/.vim/vimrcs/extended.vim
```

Finally update plugins.
