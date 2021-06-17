"{{ Custom variables
let g:is_win = has('win32') || has('win64')
let g:is_linux = has('unix') && !has('macunix')
let g:is_mac = has('macunix')
"}}


"{{ Builtin variables
" Custom mapping <leader> (see `:h mapleader`)
let mapleader=" "

let g:netrw_liststyle=3 " to get default hierarchical netrw view
"}}
