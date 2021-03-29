" NERDTree settings
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | 
    \ execute 'cd '.argv()[0] | endif

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

" vimtex settings
set conceallevel=2
let g:vimtex_toc_config={
      \'split_pos'  : ':vert :botright',
      \'split_width':  50,
      \}
let g:vimtex_view_method='skim'
let g:vimtex_syntax_conceal_cites = {
      \ 'type': 'brackets',
      \ 'icon': '📖',
      \}

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
