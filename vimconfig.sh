#/bin/bash
# This script sets up a new .vimrc, as well as Vundle for the plugin manager. The plugins include airline (with patched fonts).

# Download Vundle, a plug-in manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Load in .vimrc (vim config file) from this repo
cp configs/.vimrc ~/.vimrc
# Download patched fonts for airline (special status bar at the bottom)
# Note: you will have to change the font of your terminal manually to actually make use of the fonts. The fonts as a whole are called "Powerline patched", so the font that I might load would be "Ubuntu Mono derivative Powerline Regular." I find that that font at size 13 is a suitable replacement in gnome-terminal, the default Ubuntu terminal. More documentation can be found in the README.md for the powerline fonts. 
git clone https://github.com/powerline/fonts.git
./fonts/install.sh
rm -rf fonts
# Use Vundle to install all the programs called for by .vimrc
vi +PluginInstall +qall
# This line is not functional yet, but is meant to change the system's manpager to vim.
#export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""
# This line removes the background color from Molokai (the colorscheme set by .vimrc) to allow for transparent terminals. Commented out by default.
#sed -i[no-transparency.vim] 's/ctermfg=252 ctermbg=233/ctermfg=252\ ctermbg=none\ \"ctermbg=233/g' ~/.vim/bundle/molokai/colors/molokai.vim
