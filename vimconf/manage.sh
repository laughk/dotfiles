#!/bin/sh
# -----------------------------------------------------
# Default Config
# -----------------------------------------------------
SCRIPT_DIR="$(cd $(dirname $0) && pwd )"
MODE="help"
MODE_GUI="on"

# -----------------------------------------------------
# Functions
# -----------------------------------------------------
function make_link_cli(){
    if [ ! -e ${HOME}/.vimrc ] ; then
        ln -s ${SCRIPT_DIR}/vimrc ${HOME}/.vimrc && echo "vimrc Set OK!"
    fi

    if [ ! -e ${HOME}/.vim ]   ; then
        ln -s ${SCRIPT_DIR}/vim ${HOME}/.vim    && echo "vim conf dir Set OK!"
    fi
}

function make_link_gui(){
    if [ ! -e ${HOME}/.gvimrc ] ; then
        ln -s ${SCRIPT_DIR}/gvimrc ${HOME}/.gvimrc && echo "gvimrc Set OK!"
    fi
}

function del_link_cli(){
    if [ -e ${HOME}/.vimrc ] ; then
         rm -f ~/.vimrc && echo "Delete link ${HOME}/.vimrc "
    fi
    if [ -e ${HOME}/.vim ]   ; then
         rm -f ~/.vim   && echo "Delete link ${HOME}/.vim "
    fi
}

function del_link_gui(){
    if [ -e ${HOME}/.gvimrc ] ; then
         rm -f ~/.vimrc && echo "Delete link ${HOME}/.gvimrc "
    fi
}

function clone_neobundle(){
    if [ -d ${SCRIPT_DIR}/vim/bundle ] ; then
        echo "Already exist 'bundle' !!"
    else
        mkdir ${SCRIPT_DIR}/vim/bundle \
        && echo "Neobundle install Dir MADE OK!"
    fi

    git clone git://github.com/Shougo/neobundle.vim.git ${SCRIPT_DIR}/vim/bundle/neobundle.vim
}

function del_plugins(){
    rm -rf ${SCRIPT_DIR}/vim/bundle
}

function usage_msg(){
    echo "Usage: $(basename $0) [-c] {setup|unlink|pdelete|delete|help}"
}

function help_msg(){
cat << _HELP_MSG_

***OPTIONS***
-c: cli only mode on / Default 'off'

***MODE SELECT***
    setup         : setup vim confing
                    (make symlink and clone Neobundle)
    unlink        : delete symlink (ex. ~/.vimrc, ~/.vim )
                    not delete Neobundle
    pdelete       : delete all installed vim plugins
                    not delete symlink
    delete        : delete all of vim config
                    (delete symlink and Neobundle and all plugin)

    help(default) : This help Message

_HELP_MSG_
}


# -----------------------------------------------------
# Option,Param Check
# -----------------------------------------------------
[ ! -z "$1" ] && MODE="$1"

while getopts ":mc:h" GETOPTS ; do
    case ${GETOPTS} in
        # m) MODE="${OPTARG}"
           # ;;
        c) MODE_GUI="off"
           ;;
      h|*) MODE="help"
           ;;
    esac
done

# -----------------------------------------------------
# Main
# -----------------------------------------------------
case $MODE in
    setup) make_link_cli
           [ "${MODE_GUI}" = "on" ] && make_link_gui
           clone_neobundle
           exit 0
           ;;

   unlink) del_link_cli
           [ "${MODE_GUI}" = "on" ] && del_link_gui
           exit 0
           ;;

  pdelete) del_plugins
           exit 0
           ;;

   delete) del_link_cli
           [ "${MODE_GUI}" = "on" ] && del_link_gui
           del_plugins
           exit 0
           ;;

   help|h) usage_msg && help_msg
           exit 1
           ;;
esac
