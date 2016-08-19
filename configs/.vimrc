" Vundle section (https://github.com/VundleVim/Vundle.vim#quick-start)
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Colorschemes

""Gruvbox
Plugin 'morhetz/gruvbox'
"colorscheme gruvbox
"set background=dark    " Setting dark mode

""Molokai
Plugin 'tomasr/molokai'
colorscheme molokai

"Miscellaneous plugins

"Git plugin
Plugin 'tpope/vim-fugitive' 

"Statusbar plugin
Plugin 'vim-airline/vim-airline'
set laststatus=2
let g:airline_powerline_fonts = 1

"Syntax checker (use :w to activate, or :Errors)
Plugin 'scrooloose/syntastic'
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1

"Adds tab-completion in / searching
Plugin 'vim-scripts/SearchComplete'

"Adds file tree/file viewer
"Activate with :NERDTree
Plugin 'scrooloose/nerdtree'

"My own various additions
set number "Show line numbers
set mouse=a "Allow mouse interaction (can be nice for text-selection)

