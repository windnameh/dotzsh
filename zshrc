# General environment settings
export PATH=$PATH:$HOME/bin:$HOME/CLANG+LLVM/bin

# Path to your oh-my-zsh configuration.
ZSH_SUBMOD=$HOME/.zsh/submodule
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="random"
ZSH_THEME="tjkirch_mod"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras git-fast github git-remote-branch)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

source $ZSH_SUBMOD/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_SUBMOD/zsh-history-substring-search/zsh-history-substring-search.zsh
#
# history search
#
autoload up-line-or-beginning-search
autoload down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search

# Search backwards and forwards with a pattern
bindkey -M vicmd '/' history-incremental-pattern-search-backward
bindkey -M vicmd '?' history-incremental-pattern-search-forward
# set up for insert mode too
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward

#
# gtags *.h search for C++ class
#
export GTAGSFORCECPP=

#
# 256 terminal
#
export TERM='xterm-256color'

#
# color minicom
#
export MINICOM='-c on'


#
# zsh completion
#
fpath=($ZSH_SUBMOD/zsh-completions/src $fpath)

#
# aliases
#
alias e='emacsclient -t'
alias ec='emacsclient -c'
alias v='vim'
alias m='make'
alias g='nocorrect git'
alias git='nocorrect git'
