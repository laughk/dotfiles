#!/bin/bash

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
