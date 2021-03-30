"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
" source ~/.vimrc

""""" GENERAL SETTINGS
" are in plugin/config-sets.vim (use `gf` go go there, if you want)

""""" PLUGINS (vim-plug)
call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'lervag/vimtex'
Plug 'sirver/UltiSnips'
Plug 'ervandew/supertab'
Plug 'ycm-core/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'Chiel92/vim-autoformat'
Plug 'preservim/nerdtree'

Plug 'nvim-telescope/telescope.nvim' |
      \ Plug 'nvim-lua/popup.nvim' |
      \ Plug 'nvim-lua/plenary.nvim'
call plug#end()

""""" EDITOR SETTINGS and `let`s
set termguicolors " to get 256 colors in terminal
colorscheme gruvbox
let g:netrw_liststyle=3 " to get default hierarchical netrw view

" dealing with mispelllings
setlocal spell spelllang=en_ca,en_us
" fix last misspelled word, in insert mode
inoremap <c-l> <c-g>u<Esc>[s1z=`]a<c-g>u

""""" REMAPS (for basic Vim things)
" plugin-specific remaps in plugin/config-plugmaps.vim
let mapleader=" "

map <Leader>/ :nohlsearch<CR>

nnoremap <leader>h :wincmd h<cr>
nnoremap <leader>j :wincmd j<cr>
nnoremap <leader>k :wincmd k<cr>
nnoremap <leader>l :wincmd l<cr>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<cr>

nnoremap <silent> <leader>- :resize -1<cr>
nnoremap <leader>= :resize +1<cr>

" Terminal mappings
tnoremap <esc> <c-\><c-n>
if has('nvim')
  nnoremap <silent> <c-c><c-c> :split term://zsh<cr>i
  tnoremap <c-w>    <c-\><c-n><c-w>
  " No line numbers or relative line numbers in terminal buffer
  au TermOpen * setlocal nonumber norelativenumber
else
  nnoremap <silent> <c-c><c-c> :terminal<cr>
endif

""""" AUTOCOMMANDS

augroup MyVimtex
  autocmd!
  autocmd User VimtexEventQuit VimtexClean
augroup END

" Automatically change to absolute numbering in insert mode
" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
" augroup END

