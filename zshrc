# General environment settings
LLVM=$HOME/.CLANG+LLVM
export PATH=$PATH:$HOME/bin:$LLVM/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LLVM/lib

# Path to your oh-my-zsh configuration.
ZSH_SUBMOD=$HOME/.zsh/submodule
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="random"
ZSH_THEME="miloshadzic"

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
plugins=(docker git github history history-substring-search \
	tmux tmuxinator z zsh-navigation-tools)

source $ZSH/oh-my-zsh.sh

# submodule
source $ZSH_SUBMOD/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# history search
#autoload up-line-or-beginning-search
#autoload down-line-or-beginning-search
#zle -N up-line-or-beginning-search
#zle -N down-line-or-beginning-search
#bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
#bindkey "${terminfo[kcud1]}" down-line-or-beginning-search

# Search backwards and forwards with a pattern
#bindkey -M vicmd '/' history-incremental-pattern-search-backward
#bindkey -M vicmd '?' history-incremental-pattern-search-forward
# set up for insert mode too
#bindkey -M viins '^R' history-incremental-pattern-search-backward
#bindkey -M viins '^F' history-incremental-pattern-search-forward

# gtags *.h search for C++ class
export GTAGSFORCECPP=

# 256 color terminal
export TERM='xterm-256color'
# 256 color tmux
alias tmux="tmux -2"

# color minicom
export MINICOM='-c on'


# zsh completion
fpath=($ZSH_SUBMOD/zsh-completions/src $fpath)

# aliases
alias v='vim'
alias m='make'
alias g='nocorrect git'
alias git='nocorrect git'


# colored man-pages
if [[ "$OSTYPE" = solaris* ]]
then
	if [[ ! -x "$HOME/bin/nroff" ]]
	then
		mkdir -p "$HOME/bin"
		cat > "$HOME/bin/nroff" <<EOF
#!/bin/sh
if [ -n "\$_NROFF_U" -a "\$1,\$2,\$3" = "-u0,-Tlp,-man" ]; then
	shift
	exec /usr/bin/nroff -u\$_NROFF_U "\$@"
fi
#-- Some other invocation of nroff
exec /usr/bin/nroff "\$@"
EOF
		chmod +x "$HOME/bin/nroff"
	fi
fi

man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[38;5;039m") \
		LESS_TERMCAP_md=$(printf "\e[38;5;039m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;41;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[38;5;064m") \
		PAGER="${commands[less]:-$PAGER}" \
		_NROFF_U=1 \
		PATH="$HOME/bin:$PATH" \
			man "$@"
}

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}
