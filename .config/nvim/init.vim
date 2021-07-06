" Description: neovim config file (neovim version of Vim's .vimrc file)
"   to be placed at $HOME/.config/nvim/init.vim
" Author: jacob louis hoover
" Date: summer 2021

"{{{ Main configurations: a list of config files to source from
" Organization taken from http://github.com/jdhao/nvim-config
" Note, order matters (in particular, variables must be first)

" In order, that is:
" - general 'let's (use `gf` to go to that file, or any of the following)
" - Coc specific settings (mostly defaults from the Coc readme)
" - general 'au's
" - general remappings
" - load and configure plugins (plugin-specific 'let's and 'set's are here)
" - general 'set's
" - colortheme, gui-specific font settings, and such

let g:config_file_list = [
      \ 'core/variables.vim',
      \ 'core/coc.vim',
      \ 'core/autocommands.vim',
      \ 'core/mappings.vim',
      \ 'core/plugins.vim',
      \ 'core/settings.vim',
      \ 'core/ui.vim'
      \ ]
let g:nvim_config_root = expand('<sfile>:p:h')
for s:fname in g:config_file_list
  execute printf('source %s/%s', g:nvim_config_root, s:fname)
endfor
"}}}

" This will read in lua file ./lua/entrance.lua
" see there for any lua scripts that I am using.
lua require('entrance')

" 
" let g:python3_host_prog = expand('~/anaconda3/envs/py3/bin/python')


" vim:foldmethod=marker:foldlevel=1
