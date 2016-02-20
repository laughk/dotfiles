#! zsh

# Alias
# ----------------------------------------
alias tmux="tmux -2"
if [[ $(uname) = Darwin ]] ; then
  alias find="gfind"
  alias ls='ls -GF'
  alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
  alias mvim="/Applications/MacVim.app/Contents/MacOS/mvim"
  alias gvim=mvim
else
  alias ls='ls --color=auto -F'
fi

