" Neobundle ... Neobundleに関する設定を書いておく
" ------------------------------------------------------------------------------------
" filetype plugin indent off

if has('vim_starting')
  set nocompatible
  set rtp+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

"============================
" 以下、追加プラグイン
"============================
" Text Format -------------------------
NeoBundle 'Align'
NeoBundle 'DrawIt'

" File Type Def -----------------------
NeoBundle 'sh.vim'

" Color Scheme ------------------------
NeoBundle 'molokai'
NeoBundle 'altercation/vim-colors-solarized'

" Python -----------------------------
NeoBundle 'scrooloose/syntastic'
NeoBundleLazy 'kevinw/pyflakes-vim', {
  \ 'autoload' : {
  \ 'filetypes' : [ 'python', 'python3', 'djangohtml', 'htmljinja' ]
  \ },
\}
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
NeoBundle 'Mudox/vim-chameleon'
NeoBundle 'sophacles/vim-bundle-mako'

" Normal Utility ----------------------
NeoBundle 'sudo.vim'
NeoBundle 'YankRing.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'Shougo/vimfiler.vim'
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
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'idanarye/vim-merginal'
NeoBundle 'gregsexton/gitv'
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
if has('unix')
  NeoBundle 'vim-scripts/fcitx.vim'
endif

" edit Utility -------------------------
NeoBundleLazy 'css_color.vim', {
  \ 'autoload' : {
  \   'filetypes' : [ 'css' ]
  \  },
\}
NeoBundle 'rodjek/vim-puppet'
NeoBundleLazy 'puppetlabs/puppet-syntax-vim', {
  \ 'autoload': {'filetypes': ['puppet']}
\}

" GUI Only -----------------------------
NeoBundle 'fuenor/qfixgrep', { 'gui' : 1 }
NeoBundle 'fuenor/qfixhowm', { 'gui' : 1 }


call neobundle#end()

filetype plugin indent on

NeoBundleCheck
