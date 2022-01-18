set nocompatible
filetype off 

set guicursor=
set termguicolors
set noshowmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set relativenumber
set wrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set noshowmode
set encoding=utf-8
set ruler
set updatetime=50
set colorcolumn=80
set laststatus=2

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jpalardy/vim-slime'
Plug 'APZelos/blamer.nvim'
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'

" telescope requirements ---- 
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" debugging tools ----
Plug 'puremourning/vimspector'

call plug#end()

filetype plugin indent on

" Set colorscheme
set t_Co=256
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
let g:gruvbox_invert_selection='0'

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" telescope fzy native
lua << EOF
require('telescope').load_extension('fzy_native')
EOF

"lightline colorscheme
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \}

" Vim-slime
let g:slime_target = "tmux"

" nertw as NERDtree style
let g:netrw_banner = 0
let g:netrw_liststyle = 3

let mapleader = " "

" Git Blamer
let g:blamer_enabled = 1
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
let g:blamer_delay = 2000

" Find files using Lua functions
nmap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nmap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nmap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nmap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" debugging mappings
let g:vimspector_enable_mappings = 'HUMAN'

nmap <leader>dl :call vimspector#Launch()<cr>
nmap <leader>dr :VimspectorReset<cr>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
nmap <leader>di <Plug>VimspectorBalloonEval
xmap <leader>di <Plug>VimspectorBalloonEval

let g:vimspector_install_gadgets = ['debugpy']
