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
Plug 'junegunn/seoul256.vim'
Plug 'AlessandroYorba/Alduin'

" Python -----------------------------
Plug 'scrooloose/syntastic'
Plug 'kevinw/pyflakes-vim',       {'for': ['python', 'python3', 'djangohtml', 'htmljinja']}
Plug 'jmcantrell/vim-virtualenv', {'for': ['python', 'python3', 'djangohtml', 'htmljinja']}
Plug 'davidhalter/jedi-vim',      {'for': ['python', 'python3']}
Plug 'Mudox/vim-chameleon'
Plug 'sophacles/vim-bundle-mako'

" Normal Utility ----------------------
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimfiler.vim'
Plug 'justinmk/vim-dirvish'
Plug 'Shougo/vimproc', {'do': 'make'}
Plug 'Shougo/vimshell'
Plug 'corntrace/bufexplorer'
Plug 'fholgado/minibufexpl.vim'
Plug 'gregsexton/gitv'
Plug 'idanarye/vim-merginal'
Plug 'kannokanno/previm'
Plug 'scrooloose/nerdcommenter'
Plug 'thinca/vim-quickrun'
Plug 'thinca/vim-ref'
Plug 'tpope/vim-fugitive'
Plug 'tyru/open-browser.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'LeafCage/yankround.vim'
if has('unix') && !has('mac')
  Plug 'vim-scripts/fcitx.vim'
endif
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }
  Plug 'zchee/deoplete-jedi'
else
  Plug 'Shougo/neocomplete.vim'
endif

" edit Utility -------------------------
Plug 'css_color.vim',                {'for': ['css']}
Plug 'fuenor/qfixgrep'
Plug 'fuenor/qfixhowm'
Plug 'Yggdroot/indentLine'
Plug 'pearofducks/ansible-vim'
Plug 'vim-scripts/gitignore.vim'
Plug 'kchmck/vim-coffee-script', {'for': ['coffee']}
Plug 'junegunn/vim-emoji'
Plug '13k/vim-nginx'
Plug 'mileszs/ack.vim'
Plug 'gko/vim-coloresque'

call plug#end()
