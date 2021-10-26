source ~/.profile

#silence the 'default interactive shell is now zsh' message
export BASH_SILENCE_DEPRECATION_WARNING=1

alias ls='ls -F'    # for folders to stand out, with / after
alias ll='ls -lh'   # copy behaviour in zsh
alias la='ls -oAhF' # full info version of ls
alias be='bundle exec' # in order to use 'be jekyll serve'
alias please=sudo
alias thanks='echo "no problem"; sleep 0.5; logout'
# for 'reload' instead of restarting termina after editing this file
alias reload='source ~/.bash_profile && echo "File .bash_profile reloaded correctly" || echo "Syntax error, could not import the file"'

# for colorized terminals
export CLICOLOR=1
export LSCOLORS=GxBxCxDxexegadabagacad

export PS1="\[\e[0;35m\]->> \[\e[1;34m\]\W\[\e[0;37m\] \u$ "
export PS2="$ "
export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="/Applications/SWI-Prolog.app/Contents/MacOS:$PATH"
export PATH="/Applications/Skim.app/Contents/SharedSupport/:$PATH"

# for colorized man pages with default pager
#export LESS_TERMCAP_mb=$'\e[1;32m'
#export LESS_TERMCAP_md=$'\e[1;32m'
#export LESS_TERMCAP_me=$'\e[0m'
#export LESS_TERMCAP_se=$'\e[0m'
#export LESS_TERMCAP_so=$'\e[01;33m'
#export LESS_TERMCAP_ue=$'\e[0m'
#export LESS_TERMCAP_us=$'\e[1;4;31m'

# alternative pager. colorizes, has multiple window support, etc:
export PAGER="most"

# added by Anaconda2 4.1.1 installer
# export PATH="/Users/j/anaconda2/bin:$PATH"  # commented out by conda initialize

# added by Anaconda2 5.1.0 installer
# export PATH="/anaconda2/bin:$PATH"  # commented out by conda initialize

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

# adding SML path, and tutch
export PATH="/usr/local/Cellar/smlnj/110.84/bin:$PATH"
export PATH="/usr/local/tutch/bin:$PATH"

# Put ruby first in path
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH=$HOME/gems/bin:$PATH

# For compilers to find ruby
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"

# For pkg-config to find ruby
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

# for rbenv
eval "$(rbenv init -)"
export PATH="/usr/local/opt/openssl/bin:$PATH"

export PATH="/Applications/Xcode.app/Contents/Developer/usr/bin:$PATH"

# TORCH
export PATH=$PATH:/Users/j/torch/install/bin
# opencl for torch: torch-cl
export PATH=$PATH:/Users/j/torch/torch-cl/install/bin/

# hdf5
## HDF5 1.10 is installed. So is 1.8, but not symlinked to /usr/local/
## To have hdf5@1.8 first in your PATH:
export PATH="/usr/local/opt/hdf5@1.8/bin:$PATH"
## For compilers to find hdf5@1.8 you may need to set:
export LDFLAGS="-L/usr/local/opt/hdf5@1.8/lib"
export CPPFLAGS="-I/usr/local/opt/hdf5@1.8/include"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/j/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/j/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/j/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/j/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
conda deactivate

. "$HOME/.cargo/env"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
