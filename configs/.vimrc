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


""""Plugin Section
Plugin 'tomasr/molokai' "The very best color scheme
silent! colorscheme molokai

Plugin 'tpope/vim-fugitive' "git wrapper for vim

Plugin 'vim-airline/vim-airline' "Fancy and functional statusline that integrates with vim-fugitive/git
set laststatus=2
let g:airline_powerline_fonts = 0 "Enables good-looking symbols in the statusline, but requires special fonts (that are installed with vimconfig.sh). Set to 0 to run vim-airline without special characters
"let g:airline_section_c = '%F' "Shows filepath

"Plugin 'Valloric/YouCompleteMe' "Syntactic and semantic autocompletion

"Plugin 'scrooloose/syntastic' "Syntax/semantics checker (needs to be properly
"configured
let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_enable_signs=1

Plugin 'tpope/vim-repeat' "Enables '.' repeating for use with plugin maps. Used for tpope/vim-surround
Plugin 'tpope/vim-surround' "More powerful manipulations of parens, brackets, HTML/CSS tags, etc

"Plugin 'ctrlpvim/ctrlp.vim' "Among other things, enables autocomplete for items not in the current file

"Plugin 'scrooloose/nerdtree' "File tree explorer
"Plugin 'Xuyuanp/nerdtree-git-plugin' "git plugin for file tree explorer

Plugin 'majutsushi/tagbar' "Browse ctags (functions, variables, etc.) in a split window
"Needs exuberant-ctags installed (sudo apt install exuberant-ctags)

Plugin 'scrooloose/nerdcommenter' "Allows you to comment lines in and out

Plugin 'rstacruz/sparkup', {'rtp': 'vim/'} "Uses <C-e> to autocomplete HTML

Plugin 'airblade/vim-gitgutter'

"Plugin 'Yggdroot/indentLine' "Visually illustrates indentation section, but
"requires font patched with the character below.
let g:indentLine_char = "︙"

"Cleaner, more functional file manager
Plugin 'tpope/vim-vinegar'

"""" Configuration section
set number "Show line numbers
set noshowmode
set showcmd "Displays command letters as you enter them
set mouse=a "Enable mouse support
set t_Co=256 "Set 256 colors in terminal for colorscheme (off by default in math lab

let g:python_host_prog = '/usr/bin/python'
autocmd FileType python setlocal foldmethod=indent "Automatic folding for python (za to fold/unfold, or :help fold for more info)

set colorcolumn=80 "Colors vertical line 80 (nice for keeping line-length in mind)
autocmd FileType sh set textwidth=80
"In bash scripts, wrap lines at column 80


"""""""" CUSTOM BINDINGS """"""""
noremap <Leader>j <C-W><C-J> "Custom bindings for navigating window splits
noremap <Leader>k <C-W><C-K> "Custom bindings for navigating window splits
noremap <Leader>l <C-W><C-L> "Custom bindings for navigating window splits
noremap <Leader>h <C-W><C-H> "Custom bindings for navigating window splits

nnoremap <S-e> :! ./% <Enter>
"Runs the current file according to shebang, with Shift-E
"Note--This will be overwritten by any of the specific interpreters in
"subsequent lines

autocmd FileType python map <buffer> <S-e> :w<CR>:!/usr/bin/env python3 %<CR>
"In a python file, Shift+E runs the file in the python3 interpreter
autocmd FileType cpp map <buffer> <S-e> :w<CR>:!g++ -c %<CR>:!./a.out<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Courtesy of rdlugosz at https://github.com/rdlugosz/dotfiles/blob/604a8faeee42f6bd7f0224a953eef2962ee61652/vimrc#L488-L509
"" STATUS LINE (won't see much unless we disable Airline)
"" see: :help 'statusline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set statusline=         "reset
"set statusline+=%#todo# "set color
"set statusline+=[       "open bracket char
"set statusline+=%n      "buffer number
"set statusline+=%M      "modifiable/modified flag
"set statusline+=%R      "Readonly flag
"set statusline+=%W      "Preview window flag
"set statusline+=]%*     "close bracket & reset color
"set statusline+=%<      "cut from here if line is too long
"set statusline+=./%f    "relative path of the filename
"set statusline+=[%{strlen(&fenc)?&fenc:'wtf-enc'}\| "file encoding
"set statusline+=%{&ff}\| "file format
"set statusline+=%{strlen(&ft)?&ft:'zomg'}] "file type
"set statusline+=%=      "left/right separator
"set statusline+=%{fugitive#statusline()}\  "git branch
"set statusline+=%c,     "cursor column
"set statusline+=%l/%L   "cursor line/total lines
"set statusline+=\ (%P)  "escaped space, percent through file

augroup C++
au BufEnter *.h,*.cpp,*.cc cd %:p:h
"au BufNewFile,BufRead,BufEnter *.h,*.cpp,*.cc set formatoptions=tcqr
au BufNewFile,BufRead,BufEnter *.h,*.cpp,*.cc set shiftwidth=4
"au BufNewFile,BufRead,BufEnter *.h,*.cpp,*.cc set smarttab 
"au BufNewFile,BufRead,BufEnter *.h,*.cpp,*.cc set cindent
"au BufNewFile,BufRead,BufEnter *.h,*.cpp,*.cc set nospell
au BufNewFile,BufRead,BufEnter *.h,*.cpp,*.cc map  <Leader>c :w<cr>:!g++ %<cr>
au BufNewFile,BufRead,BufEnter *.h,*.cpp,*.cc map <Leader>r :!./a.out<cr>
"au BufNewFile,BufRead,BufEnter *.h,*.cpp,*.cc map ;l o<esc>75i/<esc>o<esc>
au BufNewFile,BufRead,BufEnter *.h,*.cpp,*.cc map <Leader>m :make<cr>

Plugin 'https://github.com/vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
augroup END
