""""" Basic editor ui settings
set background=dark                 " tell vim what the background is like

" gruvbox settings must come before colorscheme is set
let g:gruvbox_invert_selection=0
colorscheme gruvbox                 " be gruvy (or gruvbox8)

" map c-s to write for quick sa
nnoremap <c-s> :write<cr>
inoremap <c-s> <c-o>:write<cr>

""""" neovide editor
if exists('g:neovide')
  set guifont=Fira\ Code:h14
  " a little less opacity is nicer
  let g:neovide_window_floating_opacity=0.8
  " some nonsense, but it's fun
  let g:neovide_cursor_vfx_mode = "pixiedust"
  " map cmd-v to paste from system clipboard
  nnoremap <D-v> p<cr>
  inoremap <D-v> <c-o>p<cr>
  cnoremap <D-v> <c-r>*
  " map cmd-s to write
  nnoremap <D-s> :w<cr>
  inoremap <D-s> <c-o>:w<cr>
  " map cmd-w to :q
  nnoremap <D-w> :q<cr>
  inoremap <D-w> <c-o>:q<cr>
endif

""""" VV editor
if exists('g:vv')
  " For some reason, if guifont is set before, VV bugs out and needs this reset,
  " so I'm just letting it win that battle, and only setting font withing the
  " neovide if block above... ¯\_(¨⁄)_/¯
  VVset fontfamily=FiraMono\ Nerd\ Font\ Mono
  VVset fontsize=14
  " VVset letterspacing=1
  VVset lineheight=1.2

  VVset windowheight=80%
  VVset windowleft=0
  VVset windowtop=0

  " map cmd-s to write
  nnoremap <D-s> :w<cr>
  inoremap <D-s> <c-o>:w<cr>
endif

"""""" Highlight settings

if g:colors_name[:7]=='gruvbox8'
  " The default for the vert bar is italic which is silly
  hi! link netrwTreeBar Delimiter
  " I find the defaults for Startify horrid.
  hi! link StartifyBracket Identifier
  hi! link StartifyFile Ignore
  hi! link StartifyNumber PreProc
  hi! link StartifyPath FloatBorder
  hi! link StartifySlash FloatBorder
  hi! link StartifySection Type
  hi! link StartifySpecial Whitespace
  hi! link StartifyHeader Delimiter
  hi! link StartifyFooter Delimiter
  " for gruvbox8, I find it necessary to get rid of fg coloring for spelling
  hi SpellBad guifg=NONE gui=undercurl
  hi SpellCap guifg=NONE gui=undercurl
  hi SpellRare guifg=NONE gui=undercurl
  hi SpellLocal guifg=NONE gui=undercurl
endif

" hi SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
" hi SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
" hi SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE
