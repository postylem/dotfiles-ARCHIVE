" NERDTree settings
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if
      \ argc() == 1
      \ && isdirectory(argv()[0])
      \ && !exists('s:std_in') |
      \ execute 'NERDTree' argv()[0] |
      \ execute 'cd '.argv()[0] |
      \ endif

" ------------------
" vim-bufferline settings

let g:bufferline_echo = 0



" ------------------
" vim-airline settings

" only display encoding/eol type if it *isn't* 'utf-8[unix]'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

" spelling takes up space
let g:airline_detect_spell=0
" skip empty sections
" let g:airline_skip_empty_section=1

call airline#parts#define_raw('linenr', '%l')
call airline#parts#define_raw('colnr', '%2v')
call airline#parts#define_accent('colnr', 'bold')
let g:airline_section_z = airline#section#create(['linenr', ':', 'colnr'])

" Note: You must define the dictionary first before setting values.
" Also, it's a good idea to check whether it exists as to avoid
" accidentally overwriting its contents.
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
" let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
" let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
" let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
" let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.dirty='⚡'
" let g:airline_symbols.colnr = ' ㏇:'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline_mode_map = {
        \ '__'     : '-',
        \ 'c'      : 'C',
        \ 'i'      : 'I',
        \ 'ic'     : 'I',
        \ 'ix'     : 'I',
        \ 'n'      : 'N',
        \ 'multi'  : 'M',
        \ 'ni'     : 'N',
        \ 'no'     : 'N',
        \ 'R'      : 'R',
        \ 'Rv'     : 'R',
        \ 's'      : 'S',
        \ 'S'      : 'S',
        \ ''     : 'S',
        \ 't'      : 'T',
        \ 'v'      : 'V',
        \ 'V'      : 'V',
        \ ''     : 'V',
        \ }

" ------------------
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

" ignore overeager chktex warnings by just regexing them
" TODO: put this in the .chktexrc file somehow
let g:syntastic_tex_chktex_quiet_messages = {
      \ 'regex': [
        \   'You should enclose the previous parenthesis with',
        \   'is normally not followed by'
        \ ],
        \}

" ------------------
" vimtex settings
set conceallevel=2
let g:vimtex_view_method='skim'
let g:vimtex_toc_config={
      \'split_pos'  : ':vert :botright',
      \'split_width':  50,
      \}
let g:vimtex_syntax_conceal_cites = {
      \ 'type': 'brackets',
      \ 'icon': '📖',
      \}

" For backward sync with nvim+Skim
" https://jdhao.github.io/2021/02/20/inverse_search_setup_neovim_vimtex/
function! SetServerName()
  if has('win32')
    let nvim_server_file = $TEMP . "/curnvimserver.txt"
  else
    let nvim_server_file = "/tmp/curnvimserver.txt"
  endif
  let cmd = printf("echo %s > %s", v:servername, nvim_server_file)
  call system(cmd)
endfunction

augroup vimtex_common
  autocmd!
  autocmd FileType tex call SetServerName()
augroup END

" ------------------
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

" ------------------
" telescope.nvim setup is in lua/j/telescope.lua
