" Simple plugin to take a DOI string, translate to bibtex put the result in the
" current buffer.

function! DOI2bib(...)
  let l:doi = a:0 ? a:1 : ''
  let l:output = system('curl -s "https://api.crossref.org/works/'
        \ . l:doi .
        \ '/transform/application/x-bibtex"')
  if l:output[0] == "@"
    put =l:output
  else
    echo l:output
  endif
endfunction

" Use like for example `:DOI2bib "10.1162/ling_a_0038"`
command! DOI2bib call DOI2bib(<f-args>)

