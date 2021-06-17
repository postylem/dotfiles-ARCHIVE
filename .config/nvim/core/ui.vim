""""" Basic editor ui settings

" map c-s to write for quick saving
nnoremap <c-s> :write<cr>
inoremap <c-s> <c-o>:write<cr>

""""" VV editor
if exists('g:vv')
  VVset fontfamily=Fira\ Mono
  VVset fontsize=14
  VVset letterspacing=-1
  VVset lineheight=1.2

  VVset windowheight=80%
  VVset windowleft=0
  VVset windowtop=0

  " map cmd-s to write
  nnoremap <D-s> :w<cr>
  inoremap <D-s> <c-o>:w<cr>
endif
