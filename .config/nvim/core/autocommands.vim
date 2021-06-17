" I find I like vimtex to clean up on exit.
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
