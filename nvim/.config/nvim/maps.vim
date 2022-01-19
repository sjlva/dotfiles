let mapleader = " "

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

" Find files using Lua functions
nmap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nmap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nmap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nmap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" debugging mappings

nmap <leader>dl :call vimspector#Launch()<cr>
nmap <leader>dr :VimspectorReset<cr>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
nmap <leader>di <Plug>VimspectorBalloonEval
xmap <leader>di <Plug>VimspectorBalloonEval

