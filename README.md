# Installscripts
## My (now) inappropriately named git repository
This is my repo for scripts, configuration files, etc. I currently use Ubuntu-based distros, at least for now, so most scripts will work for those. Some of the code (particularly for doing specific tasks, like the nautilus-to-nemo script) has been pulled from various places on the internet, and moving forward I will try to source them in the body of the code itself.

## Scripts

###general-configs.sh
This script set up configurations for the following programs:
* [terminator](https://en.wikipedia.org/wiki/Terminator_(terminal_emulator))

###nautilus-to-nemo.sh
This script replaces Ubuntu's default file manager (Nautilus) with Nemo (which is more feature-filled, if not to a KDE-like degree).

Because nautilus-to-nemo.sh uses APT to add a PPA, update repository lists, and install nemo, **you must run it as root**: 
`sudo nautilus-to-nemo.sh`

###vimconfig.sh
This script sets up [vim](http://www.vim.org/) just how I like it. If you want neovim configured the same way, check out neovim-setup.sh.

The script will:
* Install Vundle, a vim plugin manager
* Copy over my .vimrc from configs/.vimrc
* Download and install patched Powerline fonts for use with vim-airline (see below)
* Use Vundle to install all plugins called for in ~/.vimrc
* Adds a line to your ~/.bashrc to use vim as the default $MANPAGER

*Note:* When running for the first time, an error message about the molokai colorscheme not being found. Ignore and hit enter.
