""""" Basic editor ui settings

" map c-s to write for quick sa
nnoremap <c-s> :write<cr>
inoremap <c-s> <c-o>:write<cr>

""""" VV editor
if exists('g:vv')
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


set guifont="Fira Code:h14"
set background=dark                 " tell vim what the background is like
colorscheme gruvbox8                " it's gruvy

if g:colors_name=='gruvbox8'
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

hi SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
hi SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
hi SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE
