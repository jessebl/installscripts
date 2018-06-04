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
" Code completion with deoplete for certain filetypes
let fts = ['python', 'py']
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-jedi'
  let g:deoplete#enable_at_startup = 1
  let b:deoplete_disable_auto_complete = 1
  autocmd FileType python,haskell  let b:deoplete_disable_auto_complete = 0
  " let g:deoplete#complete_method = 'omnifunc'
  " let g:deoplete#auto_complete_delay = 1000
  set completeopt-=preview
endif
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
