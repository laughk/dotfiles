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
NeoBundle 'SQLUtilities'

" File Type Def -----------------------
NeoBundle 'sh.vim'
NeoBundle 'petdance/vim-perl'

" Color Scheme ------------------------
NeoBundle 'molokai'
NeoBundle 'altercation/vim-colors-solarized'

" Python -----------------------------
" NeoBundle 'kevinw/pyflakes-vim'
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
NeoBundleLazy 'lambdalisue/vim-pyenv', {
  \ 'depends': ['davidhalter/jedi-vim'],
  \ 'autoload': {
  \  'filetypes': ['python', 'python3'],
  \}
\}

" Normal Utility ----------------------
NeoBundle 'grep.vim'
NeoBundle 'sudo.vim'
NeoBundle 'vtreeexplorer'
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
NeoBundle 'idanarye/vim-merginal'
NeoBundle 'gregsexton/gitv'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-scripts/fcitx.vim'
" NeoBundle 'mattn/mkdpreview-vim'
" NeoBundle 'suan/vim-instant-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" edit Utility -------------------------
NeoBundle 'css_color.vim', {
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
