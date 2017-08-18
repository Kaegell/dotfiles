#
# ~/.bashrc
#

#User-made Variables

UPMC_SSH="3476622@ssh.ufr-info-p6.jussieu.fr"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#aliases
alias ls='ls --color=auto'

function mkcd {
	mkdir -p $* && cd $*
}
