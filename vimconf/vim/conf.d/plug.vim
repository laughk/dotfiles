" vim-plug の自動インストールと
" vim-plug自身にvim-plugを管理させる
" ref.
"   - http://qiita.com/jiminko/items/f4b337ab41db751388f7
if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -vp ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug', {'dir': '~/.vim/plugged/vim-plug/autoload'}

" Text Format -------------------------
Plug 'vim-scripts/Align'

" Color Scheme ------------------------
Plug 'lsdr/monokai'
Plug 'altercation/vim-colors-solarized'

" Python -----------------------------
Plug 'scrooloose/syntastic'
Plug 'kevinw/pyflakes-vim',       {'for': ['python', 'python3', 'djangohtml', 'htmljinja']}
Plug 'jmcantrell/vim-virtualenv', {'for': ['python', 'python3', 'djangohtml', 'htmljinja']}
Plug 'davidhalter/jedi-vim',      {'for': ['python', 'python3']}
Plug 'Mudox/vim-chameleon'
Plug 'sophacles/vim-bundle-mako'

" Normal Utility ----------------------
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/vimproc', {'do': 'make'}
Plug 'Shougo/vimshell'
Plug 'bling/vim-airline'
Plug 'corntrace/bufexplorer'
Plug 'fholgado/minibufexpl.vim'
Plug 'gregsexton/gitv'
Plug 'idanarye/vim-merginal'
Plug 'kannokanno/previm'
Plug 'scrooloose/nerdcommenter'
Plug 'thinca/vim-quickrun'
Plug 'thinca/vim-ref'
Plug 'tpope/vim-fugitive'
Plug 'tsukkee/unite-help'
Plug 'tyru/open-browser.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/YankRing.vim'
if has('unix')
  Plug 'vim-scripts/fcitx.vim'
endif

" edit Utility -------------------------
Plug 'css_color.vim',                {'for': ['css']}
Plug 'puppetlabs/puppet-syntax-vim', {'for': ['puppet']}
Plug 'rodjek/vim-puppet'
Plug 'fuenor/qfixgrep'
Plug 'fuenor/qfixhowm'

call plug#end()
