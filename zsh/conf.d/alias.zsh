#! zsh


alias tmux="tmux -2"
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias mkdir='mkdir -v'

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
  alias open='gio open'
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
#   2017-12-07 neovim が終了時に固まるので一旦普通の vim を使う
# if which nvim > /dev/null 2>&1 ; then
#   alias vim=nvim
# fi

# VS Code の terminal では vim は使わないようにする
if [[ $TERM_PROGRAM = "vscode" ]] ; then
  alias vim=code
  alias nvim=code
fi


# vevn/virtualenv の activate

function _pyactivate(){
  local venv_name=${1:-venv}

  [[ -d ${venv_name} ]] && {
    source ${venv_name}/bin/activate
  }
}
alias pyactive=_pyactivate

[[ -n $TMUX ]] && {
  alias fzf=fzf-tmux 
}
