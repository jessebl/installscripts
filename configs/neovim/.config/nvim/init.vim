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
Plug 'w0rp/ale'
" Fuzzy finding with FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

" FZF bindings
nnoremap <Leader>f :Files <Enter>

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
" Neovim-specific bindings
if has ('nvim')
  " Escape terminal mode with Escape
  tnoremap <Esc> <C-\><C-n>
endif
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
