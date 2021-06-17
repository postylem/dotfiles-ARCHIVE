" Title: neovim rc / config file
" Author: jacob louis hoover



"{ Main configurations
" Organization taken from http://github.com/jdhao/nvim-config
" Note, order matters (variables first)
let g:config_file_list = ['variables.vim',
      \ 'autocommands.vim',
      \ 'mappings.vim',
      \ 'plugins.vim',
      \ 'settings.vim',
      \ 'ui.vim'
      \ ]

let g:nvim_config_root = expand('<sfile>:p:h')
for s:fname in g:config_file_list
  execute printf('source %s/core/%s', g:nvim_config_root, s:fname)
endfor
"}

" This will read in lua file ./lua/entrance.lua
" see there for any lua scripts that I am using.
lua require('entrance')

""""" GENERAL SETTINGS
" are in core/settings.vim (use `gf` go go there, if you want)

""""" REMAPS
" are in core/mappings.vim

""""" AUTOCOMMANDS
" are in core/autocommands.vim


