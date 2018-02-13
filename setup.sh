#!/bin/bash

SCRIPTDIR="$(cd $(dirname $0);pwd)"
cd $SCRIPTDIR

# vim & neovim
ln -sv ${SCRIPTDIR}/vimconf/vim ${HOME}/.vim
ln -sv ${HOME}/.vim ${HOME}/.config/nvim

# VS Code
[[ ! -d ${HOME}/.config/Code ]] && mkdir -pv ${HOME}/.config/Code
ln -sv ${SCRIPTDIR}/Code/User ${HOME}/.config/Code/User

# zsh
ln -sv ${SCRIPTDIR}/zsh/zshrc ${HOME}/.zshrc

for c in common/* ; do
  ln -sv ${SCRIPTDIR}/$c ${HOME}/.${c/common\//}
done

for x in Linux/Xorg/* ; do
  ln -sv ${SCRIPTDIR}/$x ${HOME}/.${x/Linux\/Xorg\//}
done

ln -sv ${SCRIPTDIR}/Linux/gtkrc ${HOME}/.gtkrc
ln -sv ${SCRIPTDIR}/Linux/config/* ${HOME}/.config/.

