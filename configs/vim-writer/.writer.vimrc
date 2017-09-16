" Plugin section--declare all plugins before "call plug#end()
call plug#begin()
" Adds comment action: gc
Plug 'tpope/vim-commentary'
" Autodetect indentation
Plug 'tpope/vim-sleuth'
" Code linting
Plug 'w0rp/ale', { 'do': 'g:ale_lint_on_text_changed=never' }
" Makes prose editing easier
Plug 'reedes/vim-pencil'
" Distraction-free writing
Plug 'junegunn/goyo.vim', { 'on': 'Goyo!' }
" Pandoc/markdown plugin
Plug 'vim-pandoc/vim-pandoc'
" Special characters for markdown symbols
Plug 'vim-pandoc/vim-pandoc-syntax'
" Highlight current paragraph
Plug 'junegunn/limelight.vim'
" Simple colorscheme that works with limelight
Plug 'ajh17/Spacegray.vim'
call plug#end()

 ", { 'do': 'g:limelight_conceal_ctermfg=gray' }
"""" Plugin config section
" Colorscheme
" set background=dark
colorscheme spacegray
" Use hard line wrapping with vim-pencil
let g:pencil#wrapModeDefault = 'hard'
autocmd FileType markdown,mkd,text	call pencil#init()
" Use full height of window, trigger Goyo
let g:goyo_height= '100%'
autocmd VimEnter * Goyo 
autocmd! User GoyoEnter Limelight

" Pandoc plugins
" Use <C-x><C-o> to use completion for citations if (neo)vim has python support
" (Citations look like [@tag])
set omnifunc=pandoc#completion#Complete

"""" Settings
" "Use dictionary
setlocal spell spelllang=en_us

"""" Bindings
"Compile to PDF--Requires xetex, pandoc, and Pandoc plugin
noremap <Leader>m :Pandoc pdf --latex-engine=xelatex --filter pandoc-citeproc <Enter>
"Display PDF
noremap <Leader>r :!evince "%:p:h/%:r.pdf" <Enter>
"Show the word count of the file
noremap <Leader>w :!wc "%" <Enter>
"Toggle search-term highlighting
noremap <Leader>h :set hlsearch! <Enter>
