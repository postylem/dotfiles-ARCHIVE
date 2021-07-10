" Description: loads and configures nvim plugins
"   this file is intended to be included from $HOME/.config/nvim/init.vim
" Author: jacob louis hoover
" Date: summer 2021

"{{{ Loading plugins

"{{{ Plugin installation
"
" " Instead of the standard, which is the below:
" let g:plug_home=has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged'
" " I'll use the vim location for now, even though I'm using nvim
let g:plug_home='~/.vim/plugged'
" (if I want to switch this,
" might need to run the install of vim-plug, and maybe coc again?)
"}}}

"{{{ PLUGINS (vim-plug)
call plug#begin(g:plug_home)
" If you need help for vim-plug itself (e.g. `:help plug-options`),
" (this could be omitted; it's just here for the helpfile :)
Plug 'junegunn/vim-plug'

"{{{ Git plugins
" vim-fugitive is the standard. Use the :Git command
Plug 'tpope/vim-fugitive'
" show change/delete/add in vim's sign column / gutter
Plug 'mhinz/vim-signify'
"}}}

"{{{ General editing plugins

" Add/delete surroundings of a text object
" like `sdb` to take `(foo)` or `[foo]` to `foo`
" I like this in addition to wellle/targets.vim so I can do things
" like `sainb` to add a bracket _inside the *next* bracketed text object_
Plug 'machakann/vim-sandwich'
" Use sandwich instead of surround.vim, which does mostly just a subset of the
" same things.
" Plug 'tpope/surround.vim'

" Navigate undos in a tree
Plug 'mbbill/undotree'
" Easy comment/uncomment with :Commentary command
Plug 'tpope/vim-commentary'
Plug 'sirver/UltiSnips'
" Plug 'ervandew/supertab'

" Show the content of register in preview window
Plug 'junegunn/vim-peekaboo'

" conveniently interactively tabularize text based on delimiters
Plug 'junegunn/vim-easy-align'

"}}}

"{{{ Linting, formating
" Plug 'ycm-core/YouCompleteMe'

" Conquer of Completion: Use release branch (recommended)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" syntastic is a classic Vim linter
" Plug 'vim-syntastic/syntastic'
" using ALE is perhaps better, it being asyncronous, and will work with coc,
" see https://github.com/dense-analysis/ale#faq-coc-nvim on how.
Plug 'dense-analysis/ale'

" Autoformatting
" Plug 'sbdchd/neoformat', { 'on': 'Neoformat' }
Plug 'Chiel92/vim-autoformat'
"}}}

"{{{ UI and theme plugins
" If you don't like netrw for some reason, but let's only load it on toggle
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" Get help when pressing a leader key.  Great for feature discovery.
" (this is a configured lua port of 'liuchengxu/vim-which-key')
Plug 'folke/which-key.nvim'

if !exists('g:started_by_firenvim')
  " nice startpage (configurable with bookmarks and useful for saving sessions)
  Plug 'mhinz/vim-startify'
  " nice useful statusline
  " Plug 'bling/vim-bufferline'
  Plug 'vim-airline/vim-airline'
endif

Plug 'gruvbox-community/gruvbox'
" Or, for a fast version, but a little different, gruvbox8
" customization I find necessary in settings.vim
" Plug 'lifepillar/vim-gruvbox8'

" Material theme
"Plug 'marko-cerovac/material.nvim'
"}}}

"{{{ Plugin to deal with URL
" Highlight URLs inside vim
Plug 'itchyny/vim-highlighturl'

" For Windows and Mac, we can open an URL in the browser.
if g:is_win || g:is_mac
  " open URL in browser
  Plug 'tyru/open-browser.vim'
endif
"}}}

"{{{ Navigation and tags plugin

" Pairs of handy bracket mappings like `[b` / `]b`
Plug 'tpope/vim-unimpaired'

" adds more text objects to do more powerful editing like `din)` to delete text
" in next parentheses for instance
Plug 'wellle/targets.vim'
" Only install these plugins if ctags are installed on the system
if executable('ctags')
  " plugin to manage your tags
  Plug 'ludovicchabant/vim-gutentags'
  " show file tags in vim window
  Plug 'liuchengxu/vista.vim'
endif

" Fuzzy finder popup search
Plug 'nvim-telescope/telescope.nvim' |
      \ Plug 'nvim-lua/popup.nvim' |
      \ Plug 'nvim-lua/plenary.nvim'
" Telescope Extensions: These need to be loadd with
" require('telescope').load_extension('...')
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'fhill2/telescope-ultisnips.nvim'
Plug 'fannheyward/telescope-coc.nvim'


"}}}

"{{{ Language-specific plugins

" Only use these plugin on Windows and Mac and when LaTeX is installed
if ( g:is_win || g:is_mac ) && executable('latex')
  " vimtex use autoload feature of Vim, so it is not necessary to use `for`
  " keyword of vim-plug to try to lazy-load it,
  " see https://github.com/junegunn/vim-plug/issues/785
  Plug 'lervag/vimtex'

  " Plug 'matze/vim-tex-fold', {'for': 'tex'}
  Plug 'Konfekt/FastFold'
endif

" Plug 'JuliaEditorSupport/julia-vim'

" Plugin for pandoc (and of course pandoc-syntax too)
" Assumes markdown files are pandoc markdown, and uses filetype=pandoc
Plug 'vim-pandoc/vim-pandoc' | Plug 'vim-pandoc/vim-pandoc-syntax'

"{{{ " Plugins for markdown writing without pandoc:
" " Vim tabular plugin for manipulate tabular, required by markdown plugins
" Plug 'godlygeek/tabular', {'on': 'Tabularize'}
" " markdown plugin
" Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" " Markdown JSON header highlight plugin
" Plug 'elzr/vim-json', { 'for': ['json', 'markdown'] }
"}}}
" Markdown previewing (awesome. Only for Mac and Windows)
if g:is_win || g:is_mac
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'] }
endif

Plug 'chrisbra/unicode.vim'
"}}}

call plug#end()
"}}}

"}}}

"{{{ Configuring plugins

"{{{ vim-startify settings
" color settings / highlight are in ./ui.vim
let g:startify_bookmarks = [ {'c': '~/.config/nvim'}, '~/.zshrc' ]
let g:startify_files_number = 12
function! s:list_commits()
  let git = 'git -C '. getcwd()
  let commits = systemlist(git .' log --oneline | head -n' . g:startify_files_number)
  let git = 'Git'
  return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU',]            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ { 'header': ['   Commits'],        'type': function('s:list_commits') },
      \ ]

"}}}

"{{{ open-broswer.vim settings
if g:is_win || g:is_mac
  " Disable netrw's gx mapping.
  let g:netrw_nogx = 1

  " Use another mapping for the open URL method
  nmap <leader>o <Plug>(openbrowser-smart-search)
  xmap <leader>o <Plug>(openbrowser-smart-search)
endif
"}}}

"{{{ NERDTree settings
" Start NERDTree when Vim starts with a directory argument.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if
"       \ argc() == 1
"       \ && isdirectory(argv()[0])
"       \ && !exists('s:std_in') |
"       \ execute 'NERDTree' argv()[0] |
"       \ execute 'cd '.argv()[0] |
"       \ endif
"}}}

"{{{ vista settings (universal-ctags navigator)
"
" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works for the kind renderer, not the tree renderer.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'
"}}}

"{{{ vim-easy-align settings

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"}}}

"{{{ vim-bufferline settings
" let g:bufferline_echo = 0
"}}}

"{{{ vim-airline settings

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

" let g:airline#extensions#tabline#show_buffers = 1
" let g:airline#extensions#tabline#enabled = 1

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
"}}}

"{{{ Coc settings
" coc.nvim has a lot of settings, so they are seperate: see ./coc.vim

" One that I'll put here though, is the remap of K for coc-vimtex in particular
" This is equivalent to putting the following in your
" `$HOME/.vim/after/ftplugin/tex.vim:`
"    map <buffer> K <Plug>(vimtex-doc-package)
"
nnoremap <silent> K :call <sid>show_documentation()<cr>
function! s:show_documentation()
  if index(['vim', 'help'], &filetype) >= 0
    execute 'help ' . expand('<cword>')
  elseif &filetype ==# 'tex'
    VimtexDocPackage
  else
    call CocAction('doHover')
  endif
endfunction

"}}}

"{{{ ALE settings
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'tex': ['latexindent'],
      \}
"}}}

"{{{ Airline settings
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#ale#enabled = 1
"}}}

""{{{ Syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_error_symbol = "✗"
"let g:syntastic_warning_symbol = "⚠"
"let g:syntastic_aggregate_errors = 1

"let g:syntastic_tex_checkers = ['chktex']

"" ignore overeager chktex warnings by just regexing them
"" TODO: put this in the .chktexrc file somehow
"let g:syntastic_tex_chktex_quiet_messages = {
"      \ 'regex': [
"        \   'You should enclose the previous parenthesis with',
"        \   'is normally not followed by'
"        \ ],
"        \}
""}}}

"{{{ signify settings
" Change the 'change' sign from the default '!'
let g:signify_sign_change = '~'
"}}}

"{{{ vim-pandoc settings
"place to look for references globally (assumes that 'g' is in the
"g:pandoc#biblio#sources variable string, which it is by default.
"See `:h vim-pandoc-bibliographies-module`)
let g:pandoc#biblio#bibs = ['/Users/j/Library/texmf/bibtex/bib/all.bib']
"}}}

"{{{ vim-markdowm settings

let g:vim_markdown_folding_style_pythonic = 1
" To prevent foldtext from being set:
" let g:vim_markdown_override_foldtext = 1
let g:vim_markdown_math = 1
"}}}

"{{{ markdown-preview.nvim settings

let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

"}}}

"{{{ vimtex settings

let g:vimtex_compiler_latexmk_engines = {
      \ '_'                : '-xelatex',
      \}

" Special rhs styles (based on vimtex#imaps#style_math in
" https://github.com/lervag/vimtex/blob/master/autoload/vimtex/imaps.vim)
"{{{
function! MyStyleString(command)
  if vimtex#syntax#in_mathzone()
    call inputsave()
    let user_input = input('Enter string to style: ')
    call inputrestore()
    return '\' . a:command . '{' . user_input . '}'
  endif
endfunction

" Adding to the VimtexImapsList (see :h vimtex-imaps)
call vimtex#imaps#add_map({
      \ 'lhs' : 'r',
      \ 'rhs' : 'vimtex#imaps#style_math("mathrm")',
      \ 'expr' : 1,
      \ 'leader' : '#',
      \ 'wrapper' : 'vimtex#imaps#wrap_math'
      \})
call vimtex#imaps#add_map({
      \ 'lhs' : 'R',
      \ 'rhs' : 'MyStyleString("mathrm")',
      \ 'expr' : 1,
      \ 'leader' : '#',
      \ 'wrapper' : 'vimtex#imaps#wrap_math'
      \})
" }}}

let g:vimtex_toc_config={
      \'split_pos'  : ':vert :botright',
      \'split_width':  50,
      \}
let g:vimtex_syntax_conceal_cites = {
      \ 'type': 'brackets',
      \ 'icon': '📖',
      \}

let g:vimtex_format_enabled=1

let g:vimtex_view_method='skim'

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
"}}}

"{{{ Ultisnips settings

let g:UltiSnipsEditSplit="vertical"
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" make YCM compatible with UltiSnips (if desired, set
" UltiSnipsExpandTrigger to '<tab>', and use supertab to do the following.
" However, I'll leave tab free for coc or whatever)
" let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

let g:snips_author="jacob"
let g:snips_email="postylem@gmail.com"
let g:snips_github="https://github.com/postylem"
"}}}

" see lua/utils.lua for telescope.nvim and which-key.nvim settings

"}}}

" vim:foldmethod=marker:foldlevelstart=1
