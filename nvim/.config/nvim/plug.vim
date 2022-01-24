" Plugins
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jpalardy/vim-slime'
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'vimwiki/vimwiki'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" telescope requirements ---- 
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" debugging tools ----
Plug 'puremourning/vimspector'

call plug#end()

filetype plugin indent on

" telescope fzy native
lua << EOF
require('telescope').load_extension('fzy_native')
EOF

" Vim-slime
let g:slime_target = "tmux"

" nertw as NERDtree style
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" debugging
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = ['debugpy']
