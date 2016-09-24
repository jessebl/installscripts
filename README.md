# Installscripts
## My (now) inappropriately named git repository
This is my repo for scripts, configuration files, etc. I currently use Ubuntu-based distros, at least for now, so most scripts will work for those. Some of the code (particularly for doing specific tasks, like the nautilus-to-nemo script) has been pulled from various places on the internet, and moving forward I will try to source them in the body of the code itself.

* [Scripts](#scripts)

## Scripts

### [general-configs.sh](general-configs.sh)
This script set up configurations for the following programs:
* [terminator](https://en.wikipedia.org/wiki/Terminator_(terminal_emulator))

### installscript.sh
This script installs a handful of favorite programs. For brevity's sake, look at the `apt install` line of the script to see and modify the programs to be installed. Some repositories are also added for software installation.

**you must run it as root**: `sudo ./nautilus-to-nemo.sh`

### nautilus-to-nemo.sh
This script replaces Nautilus (Ubuntu's default file manager) with Nemo (which is more feature-filled, if not to a KDE-like degree). Nemo will be installed and set as the default file manager.

Because nautilus-to-nemo.sh uses APT to add a PPA, update repository lists, and install Nemo, **you must run it as root**: `sudo ./nautilus-to-nemo.sh`

### neovim-setup.sh
This script follows the instructions from neovim's `:help nvim-from-vim`. Refers neovim to vim's configuration file (~/.vimrc). Also aliases vi and vim to nvim in bash (running `vi` will now run neovim instead).

### vimconfig.sh
This script sets up [vim](http://www.vim.org/) just how I like it. If you want neovim configured the same way, check out [neovim-setup.sh](#neovim\-setup.sh).

The script will:
* Install Vundle, a vim plugin manager
* Copy over my .vimrc from configs/.vimrc
* Download and install patched Powerline fonts for use with vim-airline (see below)
* Use Vundle to install all plugins called for in ~/.vimrc
* Adds a line to your ~/.bashrc to use vim as the default $MANPAGER

*Note:* When running for the first time, an error message about the molokai colorscheme not being found. Ignore and hit enter.
