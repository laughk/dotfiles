" // ----------------------------------
"  Gvimの設定。
"  基本はvimrcだけどGUIで必要なものはこちらに集めてある
" ---------------------------------- //
" ----------------------------------
"  基本設定 Basics
" ----------------------------------
" OSのクリップボードを使用する
set clipboard+=unnamed
set guioptions+=a
" ヤンクした文字は、システムのクリップボードに入れる
set clipboard=unnamed
" 挿入モードでCtrl+kを押すとクリップボードの内容を貼り付けられるようにする
imap <C-K>  <ESC>"*pa
" マウスポインタを表示する。(表示しない場合は mousehide にする)
set nomousehide
" ----------------------------------
"  表示全般の設定
" ----------------------------------
" GVimのカラーテーマの設定
:colorscheme evening

" メニューバーを表示しない。
set guioptions-=m
" ツールバーを表示しない。& 文字化け対策(windows向け)
if has('win32') || has('win64')
  set guioptions-=T
  " メニューを強制的に EUC-JP にする
  source $VIMRUNTIME/delmenu.vim
  set langmenu=ja_JP.euc-jp.vim
  source $VIMRUNTIME/menu.vim
endif

" フォントをConsolasにする。
if has('mac')
  set guifont=Consolas:h12
elseif has('unix')
  set guifont=Consolas\ 9
elseif has('win32') || has('win64')
  set guifont=Consolas:h8:cSHIFTJIS
endif

" 半透明に表示する（Mac,Win向け）
if has ('gui_macvim')
  set imdisable
  set transparency=10
elseif has('win32') || has('win64')
  gui
  set transparency=224
endif

" MacVim-Kaoriya で +perl,+ruby,+pyhtonにする
if has('gui_macvim')
  let $PERL_DLL="/System/Library/Perl/lib/5.10/libperl.dylib"
  let $RUBY_DLL="/usr/lib/libruby.dylib"
  let $PYTHON_DLL="/usr/lib/libpython2.7.dylib"
endif

" ----------------------------------
"  GVim のときのみ必要そうになりそうなコマンドマクロ
" ----------------------------------
" GEv/GRvでvimrcの編集と反映
command! Egv edit $MYGVIMRC
command! Rgv source $MYGVIMRC
