# Installscripts
## My (now) inappropriately named git repository
This is my repo for scripts, configuration files, etc. I currently use Ubuntu-based distros, at least for now, so most scripts will work for those. Some of the code (particularly for doing specific tasks, like the nautilus-to-nemo script) has been pulled from various places on the internet, and moving forward I will try to source them in the body of the code itself.

## Scripts
* [generalconfigs.sh](#general-configssh)
* [installscript.sh](#installscripsh)
* [nautilus-to-nemo.sh](#nautilus-to-nemosh)
* [neovim-setup.sh](#neovim-setupsh)
* [torrent.sh](#torrentsh)
* [vimconfig.sh](#vimconfigsh)
  * vim configuration file highlights

### general-configs.sh
This script set up configurations for the following programs:
* [terminator](https://en.wikipedia.org/wiki/Terminator_(terminal_emulator))

### installscript.sh
This script installs a handful of favorite programs. For brevity's sake, look at the `apt install` line of the script to see and modify the programs to be installed. Some repositories are also added for software installation.

**You must run it as root**: `sudo ./nautilus-to-nemo.sh`

### nautilus-to-nemo.sh
This script replaces Nautilus (Ubuntu's default file manager) with Nemo (which is more feature-filled, if not to a KDE-like degree). Nemo will be installed and set as the default file manager.

Because nautilus-to-nemo.sh uses APT to add a PPA, update repository lists, and install Nemo, **you must run it as root**: `sudo ./nautilus-to-nemo.sh`

### neovim-setup.sh
This script follows the instructions from neovim's `:help nvim-from-vim`. Refers neovim to vim's configuration file (~/.vimrc). Also aliases vi and vim to nvim in bash (running `vi` will now run neovim instead).

### torrent.sh
This script sorts media files in the designated folders. As-is, it scans designated directories for specific media types, and copies them to a new location with cleaned up filenames and directory structures. It also copies to a secondary location like a NAS or other whatever.

To use, just make sure that you have renamed all the filepaths appropriately. I have tried to make the file as easy as possible to edit, but please send me any suggestions for readability, modularity, etc.

#### Dependencies:
* [filebot](http://www.filebot.net/) for scanning, renaming, and reorganizing of movies an TV shows
* [calibre](https://calibre-ebook.com/) for e-book management (pretty optional)

### vimconfig.sh
This script sets up [vim](http://www.vim.org/) just how I like it. If you want neovim configured the same way, check out [neovim-setup.sh](#neovim-setupsh).

![My configured vim (well, neovim)](https://i.imgur.com/5AkLfHF.png)

The script will:
* Install Vundle, a vim plugin manager
* Copy over my .vimrc from configs/.vimrc
* Download and install patched Powerline fonts for use with vim-airline (see below)
* Use Vundle to install all plugins called for in ~/.vimrc
* Adds a line to your ~/.bashrc to use vim as the default $MANPAGER

*Note:* ~~When running for the first time, an error message about the molokai colorscheme not being found. Ignore and hit enter.~~ Commit e461728 should make it so that this script can run without any user interaction.

#### .vimrc highlights
* Vundle, a vim plugin manager
* [molokai colorscheme](https://github.com/tomasr/molokai)
* [vim-fugitive](https://github.com/tpope/vim-fugitive)-git commmands from within vim
* [vim-airline](https://github.com/vim-airline/vim-airline)-an attractive and functional statusline
* [NERDTree](https://github.com/scrooloose/nerdtree)-a file tree explorer (open with `:NERDTree`)
* Mouse support turned on
* Run currently opened file (according to its shebang) with Shift+e
* Python specific:
  * Code folding (`za` to fold/unfold, or `:help fold` for more info)
  * Run file in python3 interpreter with <S-e> (Shift + E)
* And much more! Check the comments in .vimrc for details.
