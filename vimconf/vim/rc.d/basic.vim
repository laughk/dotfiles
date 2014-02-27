" Basic ... 基本的な設定を書いておく
" ------------------------------ + -----------------------------------------------------------------
set nocompatible                "| Vi互換を殺してVimの機能をフルに使う
let mapleader = ","             "| キーマップリーダー Leader はここで , にバインドされる。
set scrolloff=5                 "| スクロール時の余白確保
set textwidth=0                 "| 一行に長い文章を書いていても自動折り返しをしない
set nobackup                    "| バックアップ取らない
set autoread                    "| 他で書き換えられたら自動で読み直す
set noswapfile                  "| スワップファイル作らない
set hidden                      "| 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start  "| バックスペースでなんでも消せるように
set formatoptions=lmoq          "| テキスト整形オプション，マルチバイト系を追加
set vb t_vb=                    "| ビープをならさない
set browsedir=buffer            "| Exploreの初期ディレクトリ
set whichwrap=b,s,h,l,<,>,[,]   "| カーソルを行頭、行末で止まらないようにする
set showcmd                     "| コマンドをステータス行に表示
set showmode                    "| 現在のモードを表示
set viminfo='50,<1000,s100,\"50 "| viminfoファイルの設定
set formatoptions=q             "| 自動で形成(改行とか)しない, qgで手動でなら可能

" Ev/Rvで編集と反映.vim
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC

" それぞれの設定ファイル編集へのショートカット
command! Evb  edit $HOME/.vim/rc.d/basic.vim
command! Evcl edit $HOME/.vim/rc.d/color.vim
command! Evn  edit $HOME/.vim/rc.d/neobundle.vim
command! Evcm edit $HOME/.vim/rc.d/complete.vim
command! Even edit $HOME/.vim/rc.d/encoding.vim
command! Evse edit $HOME/.vim/rc.d/search.vim
command! Evst edit $HOME/.vim/rc.d/statusline.vim
command! Evi  edit $HOME/.vim/rc.d/indent.vim
command! Evm  edit $HOME/.vim/rc.d/move.vim
command! Eved edit $HOME/.vim/rc.d/edit.vim
command! Evp  edit $HOME/.vim/rc.d/plugins.vim
command! Evv  edit $HOME/.vim/rc.d/view.vim

" ファイル別のテンプレートの指定 ---------------------
autocmd BufNewFile *.py 0r $HOME/.vim/template/python.py
autocmd BufNewFile *.wsgi 0r $HOME/.vim/template/python.py
autocmd BufNewFile *.pl 0r $HOME/.vim/template/perl.pl
