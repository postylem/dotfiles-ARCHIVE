This readme should be in `<runtimepath>/plugin/`---where `<runtimepath>` is for
instance `~/.vim` (see `:set runtimepath` and `:help 'runtimepath'`).

All `*.vim` files in this directory will be sourced by Vim after it
starts up (after loading the configuration file).  Putting configuration
settings in their own `.vim` files in this directory can make the vimrc or
init.vim(/lua) file cleaner.
