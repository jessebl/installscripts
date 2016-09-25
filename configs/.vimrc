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

Plugin 'tomasr/molokai' "The very best color scheme
silent! colorscheme molokai

Plugin 'tpope/vim-fugitive' "git wrapper for vim

Plugin 'vim-airline/vim-airline' "Fancy and functional statusline that integrates with vim-fugitive/git
set laststatus=2
let g:airline_powerline_fonts = 1 "Enables good-looking symbols in the statusline, but requires special fonts (that are installed with vimconfig.sh). Set to 0 to run vim-airline without special characters
"let g:airline_section_c = '%F' "Shows filepath

"Plugin 'Valloric/YouCompleteMe' "Syntactic and semantic autocompletion

"Plugin 'scrooloose/syntastic' "Syntax/semantics checker (needs to be properly
"configured
let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_enable_signs=1

Plugin 'tpope/vim-repeat'

Plugin 'tpope/vim-surround' "More powerful manipulations of parens, brackets, HTML/CSS tags, etc

Plugin 'scrooloose/nerdtree' "File tree explorer
Plugin 'Xuyuanp/nerdtree-git-plugin'

set number "Show line numbers
set noshowmode
set mouse=a "Enable mouse support
set t_Co=256 "Set 256 colors in terminal for colorscheme (off by default in math lab

let g:python_host_prog = '/usr/bin/python'
setlocal foldmethod=indent "Automatic folding for python (za to fold/unfold, or :help fold for more info)

set colorcolumn=80

"""""""" CUSTOM BINDINGS """""""" 
noremap <C-J> <C-W><C-J> "Custom bindings for navigating window splits
noremap <C-K> <C-W><C-K> "Custom bindings for navigating window splits
noremap <C-L> <C-W><C-L> "Custom bindings for navigating window splits
noremap <C-H> <C-W><C-H> "Custom bindings for navigating window splits

nnoremap <S-e> :! ./% <Enter>
"Runs the current file according to shebang, with Shift-E

"autocmd FileType python map <buffer> <S-e> :w<CR>:!/usr/bin/env python %<CR>

