#! zsh

export LANG=en_US.UTF-8
export HISTFILE=${HOME}/.zsh_history
export HIST_STAMPS="yyyy-mm-dd"
export SAVEHIST=10000000
export HISTSIZE=$SAVEHIST
if which nvim > /dev/null 2>&1 ; then
  export EDITOR=nvim
elif which nvim > /dev/null 2>&1 ; then
  export EDITOR=vim
fi
# EDITOR の値が vim の場合、tmux 内で Vim Mode で起するのでその対策
# see. http://web-salad.hateblo.jp/entry/2014/12/07/090000
bindkey -e

# history を共有
setopt share_history

# 対話シェル内でコメントアウトを使えるように
setopt interactivecomments

# 補完を強化
autoload -U compinit
compinit -u

# 自動的にpushd
setopt auto_pushd

# 補完候補をカーソル選択できるように
zstyle ':completion:*:default' menu select=1

## 補完候補の色づけ
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

PATH="${HOME}/.bin:${PATH}"
export PATH
export MANPATH="/usr/local/man:${MANPATH}"

# disable C-s and C-q
stty stop undef
stty start undef
