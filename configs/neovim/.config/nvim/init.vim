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
Plug 'w0rp/ale', { 'do': 'g:ale_lint_on_text_changed=never' }
call plug#end()

" Set section
set splitright	" Open vertical splits to the right
set splitbelow	" Open horizontal splits below

" Custom Bindings
" Toggle search-term highlighting
noremap <Leader>h :set hlsearch! <Enter>
" Neovim-specific bindings
if has ('nvim')
  " Escape terminal mode with Escape
  tnoremap <Esc> <C-\><C-n>
endif
