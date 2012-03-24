#!/bin/sh
## // --------------------------------------------
##  初回clone時に実行すると大体のファイルの置き換えをやってくれるシェル
##  やっつけ
##  --------------------------------------------- //

## bundle ディレクトリを作成
if [ -d vim/bundle ] ; then
    echo "すでにフォルダが存在します!"
else
    mkdir vim/bundle \
    && echo "Vundle install Dir MADE OK!"
fi

## HOMEに設定ファイルへのシンボリックリンクをはる
if [ ! -e ${HOME}/.vimrc ] ; then
    ln -s `pwd`/vimrc ${HOME}/.vimrc &&  echo "vimrc OK!"
fi

if [ ! -e ${HOME}/.gvimrc ] ; then
    ln -s `pwd`/gvimrc ${HOME}/.gvimrc && echo "gvimrc OK!"
fi

if [ ! -e ${HOME}/.vim ] ; then
     ln -s `pwd`/vim ${HOME}/.vim && echo "vim conf dir OK!"
fi

## vundle の実態をgithubから取得
git clone git://github.com/Shougo/neobundle.vim.git vim/bundle/neobundle.vim

## submodule で管理しているプラグインのアップデート
git submodule update --init
