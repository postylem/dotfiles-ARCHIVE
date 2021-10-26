alias rr=radian
alias please=sudo
alias thanks='echo "no problem"; sleep 0.5; exit'
alias :q=bye
# for 'reload' instead of restarting terminal after editing this file
alias reload='source ~/.zshrc && echo "File .zshrc reloaded correctly" || echo "Syntax error, could not import file"'
alias cat=ccat # for colourized cat. use \cat for the original
# for my dotfiles.git repo, which is a bare repo in the home dir
alias dotgit='git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME'

# set default (n)vim editor for easy access (use \vim for original)
alias vim=nvim
alias v=vim
# neovide alias to use multigrid by default for nice effects
alias vvv='neovide --multiGrid'
# for vimtex + zathura getting synctex to work, as described in this comment:
# https://github.com/lervag/vimtex/issues/1737#issuecomment-759953886
export DBUS_SESSION_BUS_ADDRESS='unix:path='$DBUS_LAUNCHD_SESSION_BUS_SOCKET

# To automatically start at tmux session when ssh-ing
# from https://stackoverflow.com/a/27614878/1676393
function ssht () {/usr/bin/ssh -t $@ "tmux attach || tmux new";}
# export TERM="tmux-256color" # I set this for italics instead of screen-256color
# PATH additions ----------------
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH=/usr/local/bin:$HOME/bin:$PATH
export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="/Applications/SWI-Prolog.app/Contents/MacOS:$PATH"
export PATH="/Applications/Skim.app/Contents/SharedSupport/:$PATH"
export PATH="/Library/TeX/texbin:$PATH"
export PATH="$HOME/Library/Python/3.7/bin:$PATH"
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

# -------------------------------

export PAGER="most"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/j/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
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

# path for stack (Haskell) things
export PATH="/Users/j/.local/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/j/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# default:
# ZSH_THEME="robbyrussell"
# ZSH_THEME="random" # (I hope this will one of the fancy ones)
# ZSH_THEME="spaceship"

# # for a nice prompt from 'sindresorhus/pure'
ZSH_THEME=''
autoload -U promptinit; promptinit
prompt pure

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# This may need to be uncommented if you have the issue of 
# Zsh repeats command in output mentioned here 
# https://stackoverflow.com/questions/30940299/zsh-repeats-command-in-output
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
  git
  brew
  common-aliases
  node
  npm
  sudo
  yarn
  z
  colored-man-pages
  colorize
  cp
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-vi-mode
)

# The following needs to come before sourcing oh-my-zsh...
# use zle's history-search functionality to search the history
# for entries that start with the current prefix.
# so, can type `vim ` and then <uparrow> to browse backward through
# history of commands starting with `vim `.
# Also I like to have the cursor placed at end of the line end 
# once desired command is selected (https://unix.stackexchange.com/a/97844)
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/Users/j/.gem/ruby/2.6.0/bin:$PATH"

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

## To enable cd'ing into a macOS folder alias (~/getTrueName.c)
#function cd {
#  if [ ${#1} == 0 ]; then
#    builtin cd
#  elif [ -d "${1}" ]; then
#    builtin cd "${1}"
#  elif [[ -f "${1}" || -L "${1}" ]]; then
#    path=$(getTrueName "$1")
#    builtin cd "$path"
#  else
#    builtin cd "${1}"
#  fi
#}
export PATH="/usr/local/sbin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
