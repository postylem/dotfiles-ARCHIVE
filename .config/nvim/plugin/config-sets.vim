""""" GENERAL SETTINGS

set mouse=a                         " because it's useful
set noerrorbells                    " no audio please
set tabstop=2 softtabstop=2         " insert 2 spaces for a tab
set shiftwidth=2                    " size of autoindent (should = tabstop)
set expandtab                       " convert tabs to spaces
set smartindent                     " attempt to indent automatically
set number                          " line numbers
set relativenumber                  " ^ relative (on all but the current)
set showcmd                         " show current command in progress
set ignorecase                      " for searching case-independent
set smartcase                       " ^ not if caps used (req. ignorecase)
set linebreak                       " break at words not chars (with wrap)
set background=dark                 " tell vim what the background is like
set noswapfile
"set nobackup " use undofile instead
"set nowritebackup
set undofile                        " undodir default '~/.local/nvim/undo'
set scrolloff=4                     " lines to keep above/below cursor
"set signcolumn=yes                  " left gutter for git indication etc.
set hlsearch                        " highlight search results
set incsearch                       " display incremental search results
set textwidth=80                    " max width of text being inserted
set colorcolumn=+0                  " color at n columns past 'textwidth'
set clipboard=unnamedplus           " copy/paste between vim and system
set wildmenu
set list                            " see some unruly whitespace chars
set listchars=tab:>-,trail:@,extends:>,precedes:<,nbsp:~
