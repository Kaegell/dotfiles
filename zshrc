# Lines configured by zsh-newuser-install
setopt appendhistory extendedglob
unsetopt beep
# End of lines configured by zsh-newuser-install

# File path update for userland configuration
fpath=(~/.config/zsh $fpath)

# Prettify (syntax highlighting, completion, prompt, etc)
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_ignore_space
setopt appendhistory
setopt sharehistory
setopt incappendhistory
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.config/zsh/zsh-autosuggestions.zsh

zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true

autoload -Uz compinit; compinit -i
setopt complete_in_word
autoload -Uz promptinit
promptinit

if [[ $TERM != "linux" ]] && [[ $TERM != "fbterm" ]]; then
	prompt pure
	(wal -a 80 -r &)
fi
# key-bindings (History search, del, etc)
bindkey '^[[3~' delete-char
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey '^[Od' backward-word
bindkey '^[Oc' forward-word
bindkey '^H' backward-kill-word
bindkey '^[[3^' kill-word
export PATH="$HOME/.bin:$PATH"
export LANG=en_US.UTF-8

# User variables /aliases
function mkcd {
	dir="$*"
	mkdir -p "$dir" && cd "$dir"
}
export WINEPREFIX="$HOME/.config/wine"
export PAGER='most'
alias ncanto='canto-curses'
alias ls='ls --color=auto'
alias la='ls -al'
alias reload-polybar='echo "" >>~/.config/polybar/config'
