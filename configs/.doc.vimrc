"""" Begin Vundle section (https://github.com/VundleVim/Vundle.vim#quick-start)
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
"""" End Vundle section

"""" Plugin Section
"Makes prose editing easier
Plugin 'reedes/vim-pencil'
"" Use hard line wrapping
let g:pencil#wrapModeDefault = 'hard'
autocmd FileType markdown,mkd,text	call pencil#init()
"Lowlight non-current paragraphs
Plugin 'junegunn/limelight.vim'
let g:limelight_conceal_ctermfg = 'gray'
"Centers and focuses
Plugin 'junegunn/goyo.vim'
"Trigger Limelight
autocmd! User GoyoEnter Limelight
let g:goyo_height= '100%'
autocmd VimEnter * Goyo 
"The best git wrapper
Plugin 'tpope/vim-fugitive'
Plugin 'colepeters/spacemacs-theme.vim'
if (has("termguicolors"))
  set termguicolors
endif
set background=dark
colorscheme spacemacs-theme

"""" Settings
set shiftwidth=4
set tabstop=4
set expandtab
set mouse=a
syntax on
"Use dictionary
"Setlocal instead of set, so that spellchecking isn't enabled in neovim
"terminals
setlocal spell spelllang=en_us

"""" Bindings
"Compile to PDF--Requires xetex and pandoc
noremap <Leader>m :!pandoc --latex-engine=xelatex -V indent % -o %:p:h/%:r.pdf <Enter>
"Display PDF in Okular
noremap <Leader>r :!okular %:p:h/%:r.pdf <Enter>
"Show the word count of the file
noremap <Leader>w :!wc % <Enter>
"Toggle search-term highlighting
noremap <Leader>h :set hlsearch! <Enter>
