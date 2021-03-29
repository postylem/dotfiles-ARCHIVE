" Making :help open to the right if there's space
function! Help(...)
  let l:topic = a:0 ? a:1 : ''
  if winwidth('%') >= 160 " Minimum width
    execute 'vertical botright help' l:topic
    execute 'vertical resize 78'
  else
    execute 'botright help' l:topic
  endif
endfunction

" Use :H to open a vertical or horizontal help split
command! -complete=help -nargs=? H call Help(<f-args>)
