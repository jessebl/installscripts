" Plugin section--declare all plugins before "call plug#end()
call plug#begin()
" Adds comment action: gc
Plug 'tpope/vim-commentary'
" Autodetect indentation
Plug 'tpope/vim-sleuth'
" Git wrapper/interface
Plug 'tpope/vim-fugitive'
" Show git diffs in gutter
Plug 'airblade/vim-gitgutter'
" Code linting
Plug 'w0rp/ale', { 'on': 'ALEToggle' }
" Fuzzy finding with FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
let g:deoplete#enable_at_startup = 1
set completeopt-=preview
" Go support (e.g. gofmt on write)
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Autcomplete and autoformat brackets, etc.
Plug 'jiangmiao/auto-pairs'
call plug#end()

" Set section
set splitright	" Open vertical splits to the right
set splitbelow	" Open horizontal splits below

" Change buffers without saving
set hidden
" Switch to previous buffer
nnoremap <Leader>` :b#<CR>

" Custom Bindings
" Toggle search-term highlighting
noremap <Leader>h :set hlsearch! <Enter>
" Make :make convenient
nnoremap <Leader>m :make <Enter>
" FZF for browsing buffer
nnoremap <Leader>b :Buffers <Enter>

" Neovim-specific
if has('nvim')
  " Escape terminal mode with Escape
  tnoremap <Esc> <C-\><C-n>
endif
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

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
