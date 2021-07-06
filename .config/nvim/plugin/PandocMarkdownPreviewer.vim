"Custom pandoc markdown viewing
"based on http://subhadig.net/preview-markdown-files-from-vim-the-easy-way.html
"By: Jacob Louis Hoover, github.com/postylem

" View markdown files as HTML on browser
let s:browser='open'
" or, set explicitly, like:
"let s:browser='/Applications/Brave\ Browser.app/Contents/MacOS/Brave\ Browser'

function! s:Pandoc_CSS(pandoc_use_tufte)
  " use -C (= --citeproc) for pandoc's citations extension (e.g. @chomsky.n:1975)
  " use -s (= --standalone) flag so it makes a complete XHTML file output
  " use --katex flag to set the renderer for math.
  let s:flags_list=[
        \ '--standalone',
        \ '--citeproc',
        \ '--katex',
        \ ]
  let s:global_bib_file=expand('~/all.bib')
  let s:reference_section_title='References'
  let s:whether_link_citations='true'
  let s:metadata_list = [
        \ 'bibliography=' . s:global_bib_file,
        \ 'reference-section-title=' . s:reference_section_title,
        \ 'link-citations=' . s:whether_link_citations
        \ ]
  " the cli arguments for pandoc
  let s:flags = join(s:flags_list)

  " add the additional flags for tufte-css formatting
  if a:pandoc_use_tufte
    let s:flags_list_tufte = [
          \ '--filter pandoc-sidenote',
          \ '--section-divs',
          \ '--to html5+smart'
          \ ]
    let s:pandoc_css_dir='~/.config/nvim/PandocMarkdownPreviewer/tufte-pandoc-css'
    let s:css_file_list = [
        \ s:pandoc_css_dir . '/tufte-css/tufte.css',
        \ s:pandoc_css_dir . '/pandoc.css',
        \ s:pandoc_css_dir . '/pandoc-solarized.css',
        \ s:pandoc_css_dir . '/tufte-extra.css',
        \ s:pandoc_css_dir . '/custom.css'
        \ ]
    let s:flags .= ' ' . join(s:flags_list_tufte)
    let s:flags .= ' --css ' . join(s:css_file_list, ' --css ')
    let s:flags .= ' --template ' . s:pandoc_css_dir . '/tufte'
  endif

  let s:flags .= ' --metadata ' . join(s:metadata_list, ' --metadata ')
endfunction

" global setting to decide whether to use the tufte formatting or not
let g:pandoc_use_tufte=v:true

""
" Renders the current buffer to an html file with the same name + '.html'.
function! PandocMarkdownRender()
  call s:Pandoc_CSS(g:pandoc_use_tufte)
  execute "silent !pandoc " . s:flags . " %:p" . " --output" . " %:p" . ".html"
endfunction

""
" Removes (what is presumed to be) the pandoc-rendered html file
" corresponding to the current buffer.
function! PandocMarkdownRemoveHTML()
  execute "silent !" . "rm " . "%:p" . ".html &"
endfunction

""
" Renders the current buffer and opens a browser window.
" Automatically deletes the html file when any key is pressed.
function! PandocMarkdownView()
  call PandocMarkdownRender()
  execute "silent !" . s:browser . " %:p" . ".html &"
  call getchar()
  call PandocMarkdownRemoveHTML()
endfunction

" Custom key bindings
nnoremap <localleader>v :call PandocMarkdownView()<cr>
nnoremap <localleader>r :call PandocMarkdownRender()<cr>
nnoremap <localleader>rm :call PandocMarkdownRemoveHTML()<cr>

