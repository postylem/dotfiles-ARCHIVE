"{{ Custom variables
let g:is_win = has('win32') || has('win64')
let g:is_linux = has('unix') && !has('macunix')
let g:is_mac = has('macunix')
"}}


"{{ Builtin variables
" Custom mapping <leader> (see `:h mapleader`)
let mapleader=" "

" Make vertical splitting the default for previewing files
let g:netrw_preview   = 1
" Make the default listing be tree style
let g:netrw_liststyle = 3
" Directory listing is 30%, vertical preview window is remaining 70%
let g:netrw_winsize   = 30
" hide that massive banner
let g:netrw_banner = 0
"}}
