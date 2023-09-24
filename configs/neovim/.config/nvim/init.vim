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
"  Git integration for buffers (replaces vim-gitgutter)
Plug 'lewis6991/gitsigns.nvim'
" Fuzzy finding with FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Gruvbox theme
Plug 'morhetz/gruvbox'
" Completion things
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-json',
      \'coc-html-css-support',
      \'coc-html',
      \'coc-vimlsp',
      \'coc-diagnostic',
      \'coc-docker',
      \'coc-sql',
      \'coc-sh',
      \'coc-pyright',
      \'coc-powershell',
      \'coc-phpactor',
      \'coc-php-cs-fixer',
      \'coc-omnisharp',
      \'coc-markdownlint',
      \'coc-go',
      \'coc-fish',
      \'@yaegassy/coc-ansible',
      \'coc-snippets',
      \'coc-yank',
      \'coc-yaml',
      \'coc-pairs',
      \]
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Neovim editing in Firefox!
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
if exists('g:started_by_firenvim')
  set laststatus=0
endif
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['sensible']
" Enable Tree Sitter!
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-context'
" Dim unselected text
Plug 'folke/twilight.nvim'
" Debugger
Plug 'puremourning/vimspector'
"Vim org-mode
Plug 'jceb/vim-orgmode'
" File browser
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'
" Debugger
Plug 'mfussenegger/nvim-dap'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'mfussenegger/nvim-dap-python'
Plug 'rcarriga/nvim-dap-ui'
" Sweet lua completion
Plug 'folke/neodev.nvim'
call plug#end()
nmap <leader>rn <Plug>(coc-rename)


lua << EOF
require('gitsigns').setup()
EOF

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
nnoremap <Leader>bu :Buffers <Enter>
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

colorscheme gruvbox

" See :help ignorecase, :help smartcase
set ignorecase
set smartcase

" Enable mouse controls in GUI environments
set mouse=a

"" coc-nvim configuration
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
  inoremap <silent><expr> <leader><leader> coc#refresh()
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
  inoremap <silent><expr> <tab> coc#pum#visible() ? coc#pum#next(1) : "\<tab>"
  inoremap <silent><expr> <S-tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-tab>"

else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')
nnoremap <Leader>F :Format<CR>
" Add missing Go imports on save
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
" Show symbol documentation with <leader>H
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
nnoremap <LEADER>H :call <SID>show_documentation()<CR>

lua << EOF
local function get_gtk_theme()
  local fh = io.popen("gsettings get org.gnome.desktop.interface color-scheme")
  data = fh:read'*a'
  fh:close()
  return data
end
function set_theme()
  if string.find(get_gtk_theme(), 'dark') then
    vim.cmd [[set background=dark]]
  else
    vim.cmd [[set background=light]]
  end
end
vim.cmd [[nnoremap <Leader>t :lua set_theme()<CR>]]
set_theme()
EOF

lua << EOF
require'nvim-treesitter.configs'.setup {
      -- Automatically install missing parsers when entering buffer
      auto_install = true,
      highlight = {
            enable = true,
            },
      incremental_selection = {
            enable = true,
            keymaps = {
                  node_incremental = "<Leader>o",
                  scope_incremental = "grc",
                  node_decremental = "<Leader>i",
                  },
            },
      textobjects = {
            select = {
                  enable = true,

                  -- Automatically jump forward to textobj, similar to targets.vim
                  lookahead = true,

                  keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        -- you can optionally set descriptions to the mappings (used in the desc parameter of nvim_buf_set_keymap
                        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                        },
                  -- You can choose the select mode (default is charwise 'v')
                  selection_modes = {
                        ['@parameter.outer'] = 'v', -- charwise
                        ['@function.outer'] = 'V', -- linewise
                        ['@class.outer'] = '<c-v>', -- blockwise
                        },
                  -- If you set this to `true` (default is `false`) then any textobject is
                  -- extended to include preceding xor succeeding whitespace. Succeeding
                  -- whitespace has priority in order to act similarly to eg the built-in
                  -- `ap`.
                  include_surrounding_whitespace = true,
                  },
            },
      }
EOF
lua << EOF
require("twilight").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      }
EOF

let g:vimspector_enable_mappings = 'HUMAN'
nnoremap <Leader>br <Plug>VimspectorToggleBreakpoint
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

set tabstop=4

let g:coc_filetype_map = {
  \ 'yaml.ansible': 'ansible',
  \ }

" File browser configuration
lua << EOF
-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
EOF

lua <<EOF
-- nvim-dap configuration
require("nvim-dap-virtual-text").setup({
  enabled = true,
  commented = true,
})
require('dap-python').setup('python')
require("dapui").setup()
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
EOF
