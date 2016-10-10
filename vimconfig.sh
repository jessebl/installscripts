#/bin/bash
# This script sets up a new .vimrc, as well as Vundle for the plugin manager. The plugins include airline (with patched fonts).

# Download Vundle, a plug-in manager
if [ -f $HOME/.vim/bundle/Vundle.vim]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
# Load in .vimrc (vim config file) from this repo
cp configs/.vimrc ~/.vimrc
# Download patched fonts for airline (special status bar at the bottom)
# Note: you will have to change the font of your terminal manually to actually make use of the fonts. The fonts as a whole are called "Powerline patched", so the font that I might load would be "Ubuntu Mono derivative Powerline Regular." I find that that font at size 13 is a suitable replacement in gnome-terminal, the default Ubuntu terminal. More documentation can be found in the README.md for the powerline fonts. 

#If the patched fonts for vim-airline have not been installed (as evidenced by
#the presence of the Ubuntu font), then install them.
if [ -f $HOME/.local/share/fonts/'Ubuntu Mono derivative Powerline.ttf']; then
	git clone https://github.com/powerline/fonts.git
	./fonts/install.sh
	rm -rf fonts
fi

# Use Vundle to install all the programs called for by .vimrc
vi +PluginInstall +qall
# Makes vim the default manpager (mostly for aesthetic purposes, but vim is such a functional home too)
#echo 'export MANPAGER="col -b | vim -c 'set ft=man ts=8 nomod nolist nonu' -c 'nnoremap i <nop>' -"' >> ~/.bashrc
# This line removes the background color from Molokai (the colorscheme set by .vimrc) to allow for transparent terminals. Commented out by default.
#sed -i[no-transparency.vim] 's/ctermfg=252 ctermbg=233/ctermfg=252\ ctermbg=none\ \"ctermbg=233/g' ~/.vim/bundle/molokai/colors/molokai.vim
