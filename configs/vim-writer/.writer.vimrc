" Install vim-plug
if has('nvim')
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !mkdir -p ~/.config/nvim/autoload
    silent !wget -O ~/.config/nvim/autoload/plug.vim
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  endif
else
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !mkdir -p ~/.vim/autoload
    silent !wget -O ~/.vim/autoload/plug.vim
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  endif
endif
" Plugin section--declare all plugins before "call plug#end()
call plug#begin()
" Adds comment action: gc
Plug 'tpope/vim-commentary'
" Autodetect indentation
Plug 'tpope/vim-sleuth'
" Code linting
Plug 'w0rp/ale'
" Makes prose editing easier
Plug 'reedes/vim-pencil'
" Distraction-free writing
Plug 'junegunn/goyo.vim', { 'on': 'Goyo!' }
" Pandoc/markdown plugin
" Plug 'vim-pandoc/vim-pandoc'
" Special characters for markdown symbols
Plug 'vim-pandoc/vim-pandoc-syntax'
" Solarized colorscheme
Plug 'altercation/vim-colors-solarized'
" Nice git interface from within vim
Plug 'tpope/vim-fugitive'
" Word count with :WordCount
Plug 'ChesleyTan/wordCount.vim'
" Fuzzy finding with FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

"""" Plugin config section
" Colorscheme
let g:solarized_termcolors=256
set background=light
colorscheme solarized
" Use hard line wrapping with vim-pencil
let g:pencil#wrapModeDefault = 'hard'
autocmd FileType markdown,mkd,text	call pencil#init()
" Use full height of window, trigger Goyo
let g:goyo_height= '100%'
autocmd VimEnter * Goyo 

" Pandoc plugins
" Use <C-x><C-o> to use completion for citations if (neo)vim has python support
" (Citations look like [@tag])
set omnifunc=pandoc#completion#Complete

"""" Settings
" "Use dictionary
setlocal spell spelllang=en_us
" Ignore case for insert completion, not for search
set ignorecase
set infercase
set smartcase
" Hard-wrap lines at 80 characters
set textwidth=80

"""" Bindings
"Compile to PDF--Requires xetex, pandoc, and Pandoc plugin
noremap <Leader>p :Pandoc pdf --latex-engine=xelatex --filter pandoc-citeproc <Enter>
"Compile to docx--Requires xetex, pandoc, and Pandoc plugin
noremap <Leader>d :Pandoc docx --filter pandoc-citeproc<Enter>
"Display PDF
noremap <Leader>r :!xdg-open "%:p:h/%:r.pdf" <Enter>
"Display docx
noremap <Leader>e :!xdg-open "%:p:h/%:r.docx" <Enter>
"Show the word count of the file
noremap <Leader>w :WordCount <Enter>
"Toggle search-term highlighting
noremap <Leader>h :set hlsearch! <Enter>
" Change buffers without saving
set hidden
" Switch to previous buffer
nnoremap <Leader>` :b#<CR>
nnoremap <Leader>a gwip

" vsuite makefile
if filereadable(".vsuite/makefile")
  set makeprg=make\ -f\ .vsuite/makefile
  "Compile to PDF--Requires xetex, pandoc, and Pandoc plugin
  noremap <Leader>p :make "%:r.pdf" <Enter>
  "Compile to docx--Requires xetex, pandoc, and Pandoc plugin
  noremap <Leader>d :make "%:r.docx" <Enter>
endif

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
