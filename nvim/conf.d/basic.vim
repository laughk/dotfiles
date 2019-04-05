" Basic ... 基本的な設定を書いておく
" ------------------------------ + -----------------------------------------------------------------
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
set undodir=~/.vimundo          "| undofile のパスを指定
set laststatus=2                "| 常にステータスラインを表示
set ruler                       "| カーソルが何行目の何列目に置かれているかを表示する
set wildmenu                    "| コマンド補完を強化
set wildmode=list:full          "| リスト表示，最長マッチ
set history=1000                "| コマンド・検索パターンの履歴数
set complete+=k                 "| 補完に辞書ファイル追加

if has('mac')
  set clipboard+=unnamedplus
else
  set clipboard=unnamedplus
endif

" Ev/Rvで編集と反映.vim
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC

" それぞれの設定ファイル編集へのショートカット
command! Evb  edit $HOME/.config/nvim/conf.d/basic.vim
command! Evcl edit $HOME/.config/nvim/conf.d/color.vim
command! Epg  edit $HOME/.config/nvim/conf.d/plug.vim
command! Even edit $HOME/.config/nvim/conf.d/encoding.vim
command! Evse edit $HOME/.config/nvim/conf.d/search.vim
command! Evi  edit $HOME/.config/nvim/conf.d/indent.vim
command! Evm  edit $HOME/.config/nvim/conf.d/move.vim
command! Eved edit $HOME/.config/nvim/conf.d/edit.vim
command! Evp  edit $HOME/.config/nvim/conf.d/plugins.vim
command! Evv  edit $HOME/.config/nvim/conf.d/view.vim
