" //
"  Gvimの設定。
"  基本はvimrcだけどGUIで必要なものはこちらに集めてある
"                                                       //


" ============================================================
"  基本設定 Basics
" ============================================================
" OSのクリップボードを使用する
set guioptions+=a
set clipboard=unnamedplus
" マウスポインタを表示する。(表示しない場合は mousehide にする)
set nomousehide

" ============================================================
"  表示全般の設定
" ============================================================
" GVimのカラーテーマの設定
set background=dark
colorscheme solarized

" メニューバーを表示しない。
set guioptions-=m

" マウスを使用できるようにする
set mouse=a
set guioptions+=a
set ttymouse=xterm2

" フォントをConsolasにする。
if has('mac')
  set guifont=Consolas:h12
elseif has('unix')
  set guifont=Dejavu\ Sans\ Mono\ for\ Powerline\ 10
endif

" 半透明に表示する（Mac向け）
if has ('gui_macvim')
  set imdisable
  set transparency=10
endif

" ============================================================
"  GVim のときのみ必要そうになりそうなコマンドマクロ
" ============================================================
" GEv/GRvでvimrcの編集と反映
command! Egv edit $MYGVIMRC
command! Rgv source $MYGVIMRC

" ============================================================
" GUI環境用プラグイン
" ============================================================

" +++++++++++++++++++++++++++++++++++++++++
" open-blowser.vim
" +++++++++++++++++++++++++++++++++++++++++
" カーソル下のURLをブラウザで開く
nmap fu <Plug>(openbrowser-open)
vmap fu <Plug>(openbrowser-open)

" ++++++++++++++++++++++++++++++++++++++++
" QFixHowm
" ++++++++++++++++++++++++++++++++++++++++
" 保存先の指定
set runtimepath+=~/.vim/bundle/qfixhowm
let howm_dir = $HOME.'/Dropbox/QFixHowm'

" 基本設定 ------------------------- + ---------------------
let QFixHowm_FileType = 'rst' "| ファイルタイプの拡張
let howm_fileencoding = 'utf-8'     "| utf8で作成する
let howm_fileformat = 'unix'        "| fileformat は unixで
let QFixHowm_RecentMode = 2         "| エントリのタイムスタンプを自動更新する

" super pre スクリプトの呼び出し
nnoremap <silent> g,. :<C-u>call HatenaSuperPreHighlight()<CR>
