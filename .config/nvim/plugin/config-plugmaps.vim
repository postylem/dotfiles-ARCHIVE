" REMAPS
require('j')
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>vrc :lua require('j.telescope').search_dotfiles()<CR>

nnoremap <leader>u :UndotreeShow<cr>

noremap <leader>C :Commentary<cr>

"nnoremap <silent> <leader>gd :YcmCompleter GoTo<cr>
"nnoremap <silent> <leader>gf :YcmCompleter FixIt<cr>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <leader>gg :G<cr>
nnoremap <leader>gj :diffget //3<cr>
nnoremap <leader>gf :diffget //2<cr>
