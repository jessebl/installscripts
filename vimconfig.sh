#/bin/bash
# This script sets up a new .vimrc, as well as Vundle for the plugin manager. The plugins include airline (with patched fonts).

# Download Vundle, a plug-in manager
if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
	echo "Downloading and installing Vundle, a vim plugin manager"
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
	echo "Vundle (a vim plugin manager) is already installed"
fi

# Load in .vimrc (vim config file) from this repo
echo "Copying over .vimrc (vim configuration file)"
cp configs/.vimrc ~/.vimrc

# Download patched fonts for airline (special status bar at the bottom)
# Note: you will have to change the font of your terminal manually to actually make use of the fonts. The fonts as a whole are called "Powerline patched", so the font that I might load would be "Ubuntu Mono derivative Powerline Regular." I find that that font at size 13 is a suitable replacement in gnome-terminal, the default Ubuntu terminal. More documentation can be found in the README.md for the powerline fonts.
# If the patched fonts for vim-airline have not been installed (as evidenced by
#the presence of the Ubuntu font), then install them.
if [ ! -f $HOME/.local/share/fonts/'Ubuntu Mono derivative Powerline.ttf' ]; then
	echo "Installing patched fonts for vim-airline (the fancy statusbar)"
	git clone https://github.com/powerline/fonts.git
	./fonts/install.sh
	rm -rf fonts
	echo "You will have to either:"
	echo "1) Change your terminal's font to a Powerline font (such as Ubuntu Mono derivative Powerline)"
	echo "2) Edit ~/.vimrc:"
	echo "    -let g:airline_powerline_fonts = 1 --->>"
	echo "    -let g:airline_powerline_fonts = 0"
else
	echo "Patched fonts have already been installed"
fi

# Use Vundle to install all the programs called for by .vimrc
vi +PluginClean +PluginInstall +qall
# If less in the manpager, makes vim the default manpager (mostly for aesthetic purposes, but vim is such a functional home too)
# Found in Edit 2 on https://zameermanji.com/blog/2012/12/30/using-vim-as-manpager/
if [ "$MANPAGER" == "less" ]; then
	#echo 'export MANPAGER="/bin/sh -c \"col -b | nvim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""' >> ~/.bashrc
	echo Your manpager has been changed to vim from less
else
	echo Your man pager had already been changed to vim
fi
# This line removes the background color from Molokai (the colorscheme set by .vimrc) to allow for transparent terminals. Commented out by default.
#sed -i[no-transparency.vim] 's/ctermfg=252 ctermbg=233/ctermfg=252\ ctermbg=none\ \"ctermbg=233/g' ~/.vim/bundle/molokai/colors/molokai.vim
