# Installscripts 

This is my repo for scripts, configuration files, etc. I currently use
Ubuntu-based distros, at least for now, so most scripts will work for
those. Some of the code (particularly for doing specific tasks, like the
nautilus-to-nemo script) has been pulled from various places on the
internet, and moving forward I will try to source them in the body of the
code itself.

### installscript.sh

This script installs a handful of favorite programs. For brevity's sake,
look at the `apt install` line of the script to see and modify the
programs to be installed. Some repositories are also added for software
installation.

```

### filebot.sh

Uses the program `filebot` to rename media files (movies, TV, anime) and
rearrange them in a nicer, neater directory structure. The variables inside the
script should be self-explanatory.

### nautilus-to-nemo.sh 

This script replaces Nautilus (Ubuntu's default file manager) with Nemo,
which is more configurable. Nemo will be installed and set as the default
file manager.

```

### neovim-setup.sh

This script follows the instructions from neovim's `:help nvim-from-vim`.
Refers neovim to vim's configuration file (~/.vimrc). Also aliases vi and
vim to nvim in bash (running `vi` will now run neovim instead).

### themeInstall.sh

Installs the "ultra flat" theme from this repo.

### vimconfig.sh 

This script sets up [vim](http://www.vim.org/) just how I like it. If you
want neovim configured the same way, check out
[neovim-setup.sh](#neovim-setupsh).

![My configured vim (well, neovim)](https://i.imgur.com/5AkLfHF.png)

The script will:

* Install Vundle, a vim plugin manager
* Copy over my .vimrc from configs/.vimrc
* Download and install patched Powerline fonts for use with vim-airline (see
  below)
* Use Vundle to install all plugins called for in ~/.vimrc
* Adds a line to your ~/.bashrc to use vim as the default \$MANPAGER

### .vimrc highlights

* Vundle, a vim plugin manager
* [molokai colorscheme](https://github.com/tomasr/molokai)
* [vim-fugitive](https://github.com/tpope/vim-fugitive)-git commmands from
  within vim
* [vim-airline](https://github.com/vim-airline/vim-airline)-an attractive and
* Mouse support turned on

## Files

* Ubuntu Mono Derivative Powerline and Indentline

### UbuntuIndentAndPowerline-Regular.ttf

This is my patched Ubuntu mono font for use with vim.airline and
indentline. You will need to set your terminal to use it after either
manually adding it to ~/.local/share/fonts or running [my vimconfig
script](#vimconfigsh). See configs/.vimrc for notes on what these do.
Licensed under the [Ubuntu font license](http://font.ubuntu.com/licence/),
a free license. I adapted the Ubuntu mono font from [powerline
fonts](https://github.com/powerline/fonts) using [Yggdroot's
instructions](https://github.com/Yggdroot/indentLine#font-patching).
I added the font file here for ease of use for myself and others.
