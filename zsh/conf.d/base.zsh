#! zsh

export HISTFILE=${HOME}/.zsh_history
export HIST_STAMPS="yyyy-mm-dd"
export SAVEHIST=10000000
export HISTSIZE=$SAVEHIST

# history を共有
setopt share_history

# 補完を強化
autoload -U compinit
compinit -u

# 自動的にpushd
setopt auto_pushd

# 補完候補をカーソル選択できるように
zstyle ':completion:*:default' menu select=1

## 補完候補の色づけ
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

PATH="${HOME}/local/bin:${PATH}"
export PATH
export MANPATH="/usr/local/man:${MANPATH}"
