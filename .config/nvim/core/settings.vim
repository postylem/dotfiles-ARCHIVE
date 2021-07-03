""""" GENERAL SETTINGS
set mouse=a                         " because my computer has a mouse
set noerrorbells                    " no audio please
" Leave tabstop at default 8, and set tabs next 3 sets. See why: https://www.reddit.com/r/vim/wiki/tabstop
" set tabstop=8                     " - leave default tabstop=8.
set softtabstop=2                   " - insert 2 spaces for a tab
set shiftwidth=2                    " - size of autoindent (should = tabstop)
set expandtab                       " - convert tabs -> spaces. I don't use tabs
set hidden                          " allow more than one unsaved buffer
set smartindent                     " attempt to indent automatically
set number                          " line numbers
set relativenumber                  " ^ relative (on all but the current)
set showcmd                         " show current command in progress
set ignorecase                      " for searching case-independent
set smartcase                       " ^ not if caps used (req. ignorecase)
set linebreak                       " break at words not chars (with wrap)
set scrolloff=4                     " lines to keep above/below cursor
set textwidth=80                    " max width of text being inserted
set colorcolumn=+0                  " color at n columns past 'textwidth'
set clipboard=unnamedplus           " copy/paste between vim and system
set wildmenu
set foldcolumn=auto:9               " display up to 9 columns of folds
set noswapfile
set nobackup nowritebackup          " use undofile instead (also for coc compatible)
set undofile                        " undodir default '~/.local/nvim/undo'
set updatetime=300                  " default is 4000 = 4s. too slow!
set hlsearch                        " highlight search results
set incsearch                       " display incremental search results
set conceallevel=2                  " useful for vimtex
set list                            " see some unruly whitespace chars
set listchars=tab:>-,trail:@,extends:>,precedes:<,nbsp:~
setlocal spell spelllang=en_ca,en_us

" The signcolum is a left gutter for git indication etc.
" Always show the signcolumn, otherwise coc will shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " with this patch, nvim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

set termguicolors " to get 256 colors in terminal. 
" highlight settings in ./ui.vim
