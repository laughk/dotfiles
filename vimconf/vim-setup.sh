#!/bin/bash

# Functions
# -----------------------------------------------------
# setup
function setup() {
  ln -svf ~/.dotfiles/vim ~/.vim
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
