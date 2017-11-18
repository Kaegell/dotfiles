# Lines configured by zsh-newuser-install
setopt appendhistory extendedglob
unsetopt beep
# End of lines configured by zsh-newuser-install

# File path update for userland configuration
fpath=(~/.config/zsh $fpath)

# Prettify (syntax highlighting, completion, prompt, etc)
set meta-flag on
set input-meta on
set output-meta on
set convert-meta on
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
export EDITOR=nvim
source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.config/zsh/zsh-autosuggestions.zsh

autoload -Uz compinit && compinit 
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true

setopt complete_in_word
autoload -Uz promptinit
promptinit

if [[ $TERM != "linux" ]]; then
	prompt pure
	export KEYTIMEOUT=1
	VIM_PROMPT="❯"
	PROMPT='%(?.%F{magenta}.%F{red})${VIM_PROMPT}%f '
	prompt_pure_update_vim_prompt() {
	    zle || {
	        print "error: pure_update_vim_prompt must be called when zle is active"
	        return 1
	    }
	VIM_PROMPT=${${KEYMAP/vicmd/❮}/(main|viins)/❯}
    zle .reset-prompt
}

function zle-line-init zle-keymap-select { 
    prompt_pure_update_vim_prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
	(wal -a 80 -r &)
fi

# key-bindings (History search, del, etc)
bindkey -v
bindkey '^[[3~' delete-char
bindkey '^[[5~' history-beginning-search-backward
bindkey '^[[6~' history-beginning-search-forward
bindkey '^[Od' backward-word
bindkey '^[Oc' forward-word
bindkey '^H' backward-kill-word
bindkey '^[[3^' kill-word
export PATH="$HOME/.bin:$HOME/.bin/alliance/install/bin:$PATH"
#export LANG=en_US.UTF-8

# User variables /aliases
function mkcd {
	dir="$*"
	mkdir -p "$dir" && cd "$dir"
}
export WINEPREFIX="$HOME/.config/wine"
alias ncanto='canto-curses'
alias ls='ls --color=auto'
alias la='ls -al'
alias expac-list-'expac -H M "%011m\t%-20n\t%10d" $(comm -23 <(pacman -Qqen | sort) <(pacman -Qqg base base-devel | sort)) | sort -n'
