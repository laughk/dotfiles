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
  if which htop > /dev/null 2>&1 ; then
    alias top=htop
  fi
else
  # Linux(Mac以外, Gnu系)で必要なもの
  alias ls='ls --color=auto -F'
  # for desktop linux (mozc_tool)
  [[ -f /usr/lib/mozc/mozc_tool ]] && {
    alias mozc-config="/usr/lib/mozc/mozc_tool --mode=config_dialog"
    alias mozc-dict="/usr/lib/mozc/mozc_tool --mode=dictionary_tool"
  }
fi

# colordiff があるならそちらを使う
if which colordiff > /dev/null 2>&1 ; then
  alias diff=colordiff
fi

# neovim が使えるならそちらを使う
if which nvim > /dev/null 2>&1 ; then
  alias vim=nvim
fi
