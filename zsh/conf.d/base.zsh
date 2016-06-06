#! zsh

export HISTFILE=${HOME}/.zsh_history
export HIST_STAMPS="yyyy-mm-dd"
export SAVEHIST=10000000
export HISTSIZE=$SAVEHIST

autoload -U compinit
compinit -u

PATH="${HOME}/local/bin:${PATH}"
export PATH
export MANPATH="/usr/local/man:${MANPATH}"
