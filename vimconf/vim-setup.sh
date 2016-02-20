#!/bin/bash
# Default Config
# -----------------------------------------------------
SCRIPT_NAME=${0##*/}
SCRIPT_DIR="$(cd $(dirname $0) && pwd )"
MODE="help"
MODE_GUI="off"
VIMVERSION=$( vim --version | awk 'NR ==1 {print $5}' )

# Functions
# -----------------------------------------------------

# setup
function setup() {
  ln -svf ~/.dotfiles/vim ~/.vim
  [[ ! -d ~/.vim/bundle/neobundle.vim ]] && {
    git clone \
      https://github.com/Shougo/neobundle.vim \
      ~/.vim/bundle/neobundle.vim
  }
}

# clean
function clean(){
  cd ~ ; unlink .vim && \
    echo 'Success: unlink "~/.vim"'
}

# Main
# -----------------------------------------------------
[[ $1 = 'clean' ]] && {
  clean
  exit 1
}
setup
