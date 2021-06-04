" Display things
if has('syntax') && (&t_Co > 2)
  syntax on
endif
if has('autocmd')
  filetype plugin indent on
endif
" Allow color schemes to do bright colors without forcing bold.
"if &t_Co == 8 && $TERM !~# '^Eterm'
"  set t_Co=16
"endif

" Necessary to get nice 256 colors in terminal vim with $TERM=tmux-256color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" General set-tings
set mouse=a
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set number
set relativenumber
set showcmd
set ignorecase
set smartcase " smartcase needs to have ignorecase on
set linebreak
set noswapfile
set nobackup " use undofile instead
set undodir=~/.vim/undodir " works fantastic with plugin undotree
set undofile
set scrolloff=4
"set signcolumn=yes
set incsearch
set hlsearch
set colorcolumn=80
set wildmenu

let mapleader=" "

" using junegunn/vim-plug for plugins
" use :PlugInstall to install plugins
call plug#begin('~/.vim/plugged')
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'vim-utils/vim-man'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'lervag/vimtex'
Plug 'cmhughes/latexindent.pl'
Plug 'Chiel92/vim-autoformat'
Plug 'gruvbox-community/gruvbox'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'sirver/UltiSnips'
Plug 'ervandew/supertab'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'mhinz/vim-startify'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
call plug#end()

colorscheme gruvbox
set background=dark

" for ctrlp, set working dir, and exclude .gitignore patterns
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_user_command=['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching=0

let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

" some nice mappings
nnoremap <leader>h :wincmd h<cr>
nnoremap <leader>j :wincmd j<cr>
nnoremap <leader>k :wincmd k<cr>
nnoremap <leader>l :wincmd l<cr>
nnoremap <silent> <leader>- :resize -1<cr>
nnoremap <leader>= :resize +1<cr>
nnoremap <leader>u :UndotreeShow<cr>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<cr>
noremap <leader>C :Commentary<cr>

"nnoremap <silent> <leader>gd :YcmCompleter GoTo<cr>
"nnoremap <silent> <leader>gf :YcmCompleter FixIt<cr>
map <Leader>/ :nohlsearch<CR>

" integrated terminal mappings
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


" NERDTree things
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
      \ execute 'cd '.argv()[0] | execute 'NERDTree' argv()[0] | endif

" dealing with mispelllings
setlocal spell spelllang=en_ca,en_us
inoremap <c-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_aggregate_errors = 1

let g:syntastic_tex_checkers = ['chktex']

" " latex things
" ignore overeager chktex warnings by just regexing them
" TODO: put this in the .chktexrc file somehow
let g:syntastic_tex_chktex_quiet_messages = {
      \ 'regex': [
      \   'You should enclose the previous parenthesis with',
      \   'is normally not followed by'
      \ ],
      \}

" vimtex settings
set conceallevel=2
let g:vimtex_toc_config={
      \'split_pos'  : ':vert :botright',
      \'split_width':  50,
      \}
let g:vimtex_view_method='skim'
"let g:vimtex_syntax_conceal_default=0
" let g:vimtex_syntax_conceal = {
"       \'fancy': 1,
"       \'cites': 0,
"       \}
let g:vimtex_syntax_conceal_cites = {
      \ 'type': 'brackets',
      \ 'icon': '📖',
      \}
" Clean up on exit
augroup MyVimtex
  au!
  au User VimtexEventQuit VimtexClean
augroup END

" Ultisnips settings
let g:UltiSnipsEditSplit="vertical"
"" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

let g:snips_author="jacob"
let g:snips_email="postylem@gmail.com"
let g:snips_github="https://github.com/postylem"
