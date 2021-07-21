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

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
" Plug 'lifepillar/vim-solarized8'
" Plug 'gruvbox-community/gruvbox'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'Valloric/YouCompleteMe'
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jpalardy/vim-slime'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'

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

" Vim-slime
let g:slime_target = "tmux"

" nertw as NERDtree style
let g:netrw_banner = 0
let g:netrw_liststyle = 3

let mapleader = " "
nnoremap <C-m> i %>% <esc>
