" Plugin section--declare all plugins before "call plug#end()
call plug#begin()
" Adds comment action: gc
Plug 'tpope/vim-commentary'
" Autodetect indentation
Plug 'tpope/vim-sleuth'
" Code linting
Plug 'w0rp/ale', { 'do': 'g:ale_lint_on_text_changed=never' }
call plug#end()

" Set section
set number	" Show line numbers
set splitright	" Open vertical splits to the right
set splitbelow	" Open horizontal splits below

" Custom Bindings
" Toggle search-term highlighting
noremap <Leader>h :set hlsearch! <Enter>
