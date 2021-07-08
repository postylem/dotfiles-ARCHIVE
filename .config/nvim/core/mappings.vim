"{{{ Remaps
" Put the bibtex corresponding to the doi in the system clipboard
nnoremap <silent> <leader>pp :DOI2bib "<c-r>+"<cr>

" Edit and reload init.vim quickly
nnoremap <silent> <leader>ev :<C-U>tabnew $MYVIMRC <bar> tcd %:h<cr>
nnoremap <silent> <leader>sv :<C-U>silent update $MYVIMRC <bar> source $MYVIMRC <bar>
      \ echomsg "Nvim config successfully reloaded!"<cr>

" Insert a blank line below or above current line (do not move the cursor),
" see https://stackoverflow.com/a/16136133/6064933
nnoremap <expr> oo printf('m`%so<ESC>``', v:count1)
nnoremap <expr> OO printf('m`%sO<ESC>``', v:count1)

" Jump to matching pairs easily in normal mode
nnoremap <Tab> %

" Fix last misspelled word, in insert mode
inoremap <c-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Move between buffers
nnoremap gb :buffers<CR>:buffer<Space>
nnoremap <leader>b  :buffer <c-z>
nnoremap <PageUp>   :bprevious<CR>
nnoremap <PageDown> :bnext<CR>
" See also ]b and [b from tpope/vim-unimpaired, of course.

" Stop typing :nohl all the time!
map <Leader>/ :nohlsearch<CR>

nnoremap <leader>h :wincmd h<cr>
nnoremap <leader>j :wincmd j<cr>
nnoremap <leader>k :wincmd k<cr>
nnoremap <leader>l :wincmd l<cr>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<cr>

nnoremap <silent> <leader>- :resize -1<cr>
nnoremap <leader>= :resize +1<cr>

" Integrated terminal mappings
tnoremap <esc> <c-\><c-n>
if has('nvim')
  " mimic the default ':term' behav in vim
  nnoremap <silent> <c-c><c-c> :split term://zsh<cr>
  au TermOpen * startinsert
  au BufEnter * if &buftype == 'terminal' | :startinsert | endif
  " use c-w in terminal mode in nvim (already possible in vim)
  tnoremap <c-w>    <c-\><c-n><c-w>
  " No line numbers or relative line numbers in terminal buffer
  au TermOpen * setlocal nonumber norelativenumber
  " feed another key after exiting, to really exit
  au TermClose * call feedkeys("i")
else
  nnoremap <silent> <c-c><c-c> :terminal<cr>
endif
"}}}

"{{{ PLUGIN SPECIFIC REMAPS
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>vrc :lua require('utils').search_dotfiles()<CR>

nnoremap <leader>u :UndotreeShow<cr>

noremap <leader>C :Commentary<cr>

nnoremap <leader>t :Vista!!<cr>

"nnoremap <silent> <leader>gd :YcmCompleter GoTo<cr>
"nnoremap <silent> <leader>gf :YcmCompleter FixIt<cr>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <leader>gg :G<cr>
nnoremap <leader>gj :diffget //3<cr>
nnoremap <leader>gf :diffget //2<cr>
"}}}
