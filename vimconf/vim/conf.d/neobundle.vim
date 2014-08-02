" Neobundle ... Neobundleに関する設定を書いておく
" ------------------------------------------------------------------------------------
set nocompatible
filetype plugin indent off

set rtp+=~/.vim/bundle/neobundle.vim/
call neobundle#rc()

"============================
" 以下、追加プラグイン
"============================
" Text Format -------------------------
NeoBundle 'Align'
NeoBundle 'DrawIt'
NeoBundle 'SQLUtilities'

" File Type Def -----------------------
NeoBundle 'sh.vim'
NeoBundle 'emonkak/vim-filetype-pukiwiki'
NeoBundle 'petdance/vim-perl'

" Color Scheme ------------------------
NeoBundle 'molokai'
NeoBundle 'altercation/vim-colors-solarized'

" Python -----------------------------
NeoBundle 'kevinw/pyflakes-vim'
NeoBundleLazy 'jmcantrell/vim-virtualenv', {
  \ 'autoload' : {
  \ 'filetypes' : [ 'python', 'python3', 'djangohtml', 'htmljinja' ]
  \ },
\}
NeoBundleLazy 'davidhalter/jedi-vim', {
  \ "rev" : "dev",
  \ "autoload": {
  \ "filetypes": [ "python", "python3" ]
  \},
\}

" Normal Utility ----------------------
NeoBundle 'grep.vim'
NeoBundle 'sudo.vim'
NeoBundle 'vtreeexplorer'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }
NeoBundle 'Shougo/vimshell'
NeoBundle 'corntrace/bufexplorer'
NeoBundle 'fholgado/minibufexpl.vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-scripts/fcitx.vim'
" NeoBundle 'mattn/mkdpreview-vim'
NeoBundle 'suan/vim-instant-markdown'

" edit Utility -------------------------
NeoBundle 'css_color.vim', {
  \ 'autoload' : {
  \   'filetypes' : [ 'css' ]
  \  },
\}

" GUI Only -----------------------------
NeoBundle 'fuenor/qfixgrep', { 'gui' : 1 }
NeoBundle 'fuenor/qfixhowm', { 'gui' : 1 }
NeoBundle 'tyru/open-browser.vim', { 'gui' : 1 }

filetype plugin indent on

