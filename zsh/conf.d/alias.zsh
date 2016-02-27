#! zsh


alias tmux="tmux -2"
alias pyactive="source venv/bin/activate"

if [[ $(uname) = Darwin ]] ; then
  # Macでだけ必要なもの
  alias find="gfind"
  alias ls='ls -GF'
  alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
  alias mvim="/Applications/MacVim.app/Contents/MacOS/mvim"
  alias gvim=mvim
else
  # Linux(Mac以外, Gnu系)で必要なもの
  alias ls='ls --color=auto -F'
fi

