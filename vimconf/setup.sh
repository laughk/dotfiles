#!/bin/sh

# Config
# -----------------------------------------------------
SCRIPT_DIR="$(cd $(dirname $0) && pwd )"
MODE="setup"
MODE_GUI="on"

# Functions
# -----------------------------------------------------
make_link_cli(){
    if [ ! -e ${HOME}/.vimrc ] ; then
        ln -s ${SCRIPT_DIR}/vimrc ${HOME}/.vimrc && echo "vimrc Set OK!"
    fi

    if [ ! -e ${HOME}/.vim ]   ; then
        ln -s ${SCRIPT_DIR}/vim ${HOME}/.vim    && echo "vim conf dir Set OK!"
    fi
}

make_link_gui(){
    if [ ! -e ${HOME}/.gvimrc ] ; then
        ln -s ${SCRIPT_DIR}/gvimrc ${HOME}/.gvimrc && echo "gvimrc Set OK!"
    fi
}

del_link_cli(){
    if [ -e ${HOME}/.vimrc ] ; then
         rm -f ~/.vimrc && echo "Delete link ${HOME}/.vimrc "
    fi
    if [ -e ${HOME}/.vim ]   ; then
         rm -f ~/.vim   && echo "Delete link ${HOME}/.vim "
    fi
}

del_link_gui(){
    if [ -e ${HOME}/.gvimrc ] ; then
         rm -f ~/.vimrc && echo "Delete link ${HOME}/.gvimrc "
    fi
}

clone_neobundle(){
    if [ -d ${SCRIPT_DIR}/vim/bundle ] ; then
        echo "Already exist 'bundle' !!"
    else
        mkdir ${SCRIPT_DIR}/vim/bundle \
        && echo "Neobundle install Dir MADE OK!"
    fi

    git clone git://github.com/Shougo/neobundle.vim.git ${SCRIPT_DIR}/vim/bundle/neobundle.vim
}

del_neobundle(){
    rm -rf ${SCRIPT_DIR}/vim/bundle
}

usage_msg(){
    echo "Usage: $(basename $0) [-c] [-m <s|u|d|r>]"
}

help_msg(){
cat << _HELP_MSG_

***OPTIONS***
-c: cli only mode on / Default 'off'
-m:
    mode select      / Default 's'
    s     : setup vim confing
            (make symlink and clone Neobundle)
    u     : delete symlink (ex. ~/.vimrc, ~/.vim )
            not delete Neobundle
    d     : delete all installed vim plugins
    r     : reconstruct vim config
            (delete symlink and Neobundle and all plugin)

_HELP_MSG_

}


# Option Check
# -----------------------------------------------------
while getopts ":m:c:h" GETOPTS ; do
    case ${GETOPTS} in
        m) MODE="${OPTARG}"
            ;;
        h) MODE="help"
            ;;
        c) MODE_GUI="off"
            ;;
    esac
done

# Main
# -----------------------------------------------------
case $MODE in
    setup|s)
        make_link_cli
        [ "${MODE_GUI}" = "on" ] && make_link_gui
        clone_neobundle
        exit 0
        ;;
    unlink|u)
        del_link_cli
        [ "${MODE_GUI}" = "on" ] && del_link_gui
        exit 0
        ;;
    refresh|r)
        del_link_cli
        [ "${MODE_GUI}" = "on" ] && del_link_gui
        del_neobundle

        make_link_cli
        [ "${MODE_GUI}" = "on" ] && make_link_gui
        clone_neobundle

        exit 0
        ;;

    delplugins|d)
        del_neobundle

        exit 0
        ;;
    help|h)
        usage_msg && help_msg
        exit 1
        ;;
esac

