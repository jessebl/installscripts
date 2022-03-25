" Plugin section--declare all plugins before "call plug#end()
call plug#begin()
" Adds comment action: gc
Plug 'tpope/vim-commentary'
" Autodetect indentation
" Plug 'tpope/vim-sleuth'
" Git wrapper/interface
Plug 'tpope/vim-fugitive'
:command Gst Git status
:command Gap Git add -p
:command Gd Git diff
:command Gc Git commit
" Show git diffs in gutter
Plug 'airblade/vim-gitgutter'
" Fuzzy finding with FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Autcomplete and autoformat brackets, etc.
Plug 'tmsvg/pear-tree'
let g:pear_tree_repeatable_expand = 0
" Gruvbox theme
Plug 'morhetz/gruvbox'
" Completion things
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Neovim editing in Firefox!
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
if exists('g:started_by_firenvim')
  set laststatus=0
endif
Plug 'sheerun/vim-polyglot'
call plug#end()

" Set section
set splitright	" Open vertical splits to the right
set splitbelow	" Open horizontal splits below

" Change buffers without saving
set hidden
" Switch to previous buffer
nnoremap <Leader>` :b#<CR>

set wrap linebreak nolist

" Custom Bindings
" Toggle search-term highlighting
noremap <Leader>h :set hlsearch! <Enter>
" Make :make convenient
nnoremap <Leader>m :make <Enter>

" FZF for browsing buffer
nnoremap <Leader>b :Buffers <Enter>
" FZF bindings
nnoremap <Leader>f :Files <Enter>

" ripgrep settings + bindings
if executable('rg')
  " User ripgrep as vims grep program
  set grepprg=rg\ --vimgrep
  " :Find command for opening files with queried contents
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number
        \ --no-heading --fixed-strings --ignore-case --no-ignore --hidden
        \ --follow --glob "!.git/*" --color "always"
        \ '.shellescape(<q-args>), 1, <bang>0)
  nnoremap <Leader>g :Find <Enter>
endif

" Use make to upload Arduino code
autocmd BufNewFile,BufRead *.ino set makeprg=make\ upload

" Do not highlight search results by default
set nohlsearch

set background=dark
colorscheme gruvbox

" See :help ignorecase, :help smartcase
set ignorecase
set smartcase

" Enable mouse controls in GUI environments
set mouse=a
