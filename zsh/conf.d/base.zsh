#! zsh

export HIST_STAMPS="yyyy-mm-dd"
export SAVEHIST=10000000

autoload -U compinit
compinit -u

PATH="${HOME}/local/bin:${PATH}"
export PATH
export MANPATH="/usr/local/man:${MANPATH}"
export PYTHONSTARTUP=${HOME}/.pythonstartup.py
