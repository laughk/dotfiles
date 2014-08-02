#!/bin/bash
# -----------------------------------------------------
# Default Config
# -----------------------------------------------------
SCRIPT_NAME=${0##*/}
SCRIPT_DIR="$(cd $(dirname $0) && pwd )"
MODE="help"
MODE_GUI="off"
VIMVERSION=$( vim --version | awk 'NR ==1 {print $5}' )

# -----------------------------------------------------
# Functions
# -----------------------------------------------------
function make_link(){

  local _gui=$1
  local _targets="vim"

  if [[ ${VIMVERSION} =~ 7.[0-3] ]] ; then

    _targets="$_targets vim/vimrc"

    if [[ $_gui = on ]] ; then
      _target="$_targets vim/gvimrc"
    fi

  fi

  for t in ${_targets} ; do
    ln -fs ${SCRIPT_DIR}/$t ${HOME}/.${t#vim/} && echo "${HOME}/.${t#vim/} Set OK!"
  done

}


function del_link() {

  local _gui=$1
  local _targets=".vim"

  if [[ ${VIMVERSION} =~ 7.[0-3] ]] ; then

    _targets="$_targets .vimrc"

    if [[ $_gui = on ]] ; then
      _target="$_targets .gvimrc"
    fi

  fi

  for t in ${_targets} ; do
    if [[ -e ${HOME}/$t ]] ; then
      rm -f ${HOME}/$t && echo "Delete link ${HOME}/$t "
    else
      echo "Not exist ${HOME}/$t "
    fi
  done

}


function clone_neobundle(){

  if [[ ! -d ${SCRIPT_DIR}/vim/bundle ]] ; then
    mkdir ${SCRIPT_DIR}/vim/bundle \
    && echo "Make Neobundle install Dir"
  fi

  git clone git://github.com/Shougo/neobundle.vim.git ${SCRIPT_DIR}/vim/bundle/neobundle.vim

}


function del_plugins(){
  rm -rf ${SCRIPT_DIR}/vim/bundle
}


function usage_msg(){
  echo "Usage: $SCRIPT_NAME [-c] [-m {setup|unlink|pdelete|delete}] [-h]"
}


function help_msg(){
cat << _HELP_MSG_

***OPTIONS***
-g: setup for gvim / Default 'off'
-m: mode select
-h: This help Message

***MODE SELECT***
  setup     : setup vim confing
              (make symlink and clone Neobundle)
  unlink    : delete symlink (ex. ~/.vimrc, ~/.vim )
              not delete Neobundle
  pdelete   : delete all installed vim plugins
              not delete symlink
  delete    : delete all of vim config
              (delete symlink and Neobundle and all plugin)

_HELP_MSG_

}


# -----------------------------------------------------
# Option,Param Check
# -----------------------------------------------------
if [[ -z "$@" ]] ; then
  usage_msg
  help_msg
  exit 1
fi

for OPT in $@ ; do
  case "$OPT" in
    '-h'|'--help')
        usage_msg
        help_msg
        exit 1
        ;;
    '-g'|'--enable-gui')
        MODE_GUI="on"
        shift
        ;;
    '-m'|'--mode')
        if [[ -z "$2" ]] || [[ "$2" =~ ^-+ ]] ; then
          echo "$SCRIPT_NAME: option require an argument -- $1" 1>&2
          exit 1
        fi
        MODE="$2"
        shift 2
        ;;
  esac
done

# -----------------------------------------------------
# Main
# -----------------------------------------------------
case $MODE in
  'setup')
       make_link ${MODE_GUI}
       clone_neobundle
       exit 0
       ;;
  'unlink')
       del_link ${MODE_GUI}
       exit 0
       ;;
  'pdelete')
       del_plugins
       exit 0
       ;;

  'delete')
       del_link ${MODE_GUI}
       del_plugins
       exit 0
       ;;
  *)
       usage_msg && help_msg
       exit 1
       ;;
esac
