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
" Plug 'altercation/vim-colors-solarized'
Plug 'iCyMind/NeoSolarized'
Plug 'junegunn/seoul256.vim'
Plug 'AlessandroYorba/Alduin'
Plug 'davidklsn/vim-sialoquent'
Plug 'trevordmiller/nova-vim'
Plug 'fneu/breezy'
Plug 'arcticicestudio/nord-vim'

" Python -----------------------------
"Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
Plug 'davidhalter/jedi-vim'
Plug 'Vimjas/vim-python-pep8-indent', {'for': ['python', 'python3']}

" Develop Tool ------------------------
Plug 'diepm/vim-rest-console'

" Normal Utility ----------------------
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimproc', {'do': 'make'}
Plug 'corntrace/bufexplorer'
Plug 'ap/vim-buftabline'
Plug 'gregsexton/gitv'
Plug 'idanarye/vim-merginal'
Plug 'kannokanno/previm'
Plug 'thinca/vim-quickrun'
Plug 'thinca/vim-ref'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'LeafCage/yankround.vim'
Plug 'mattn/vim-sqlfmt'
Plug 'zchee/deoplete-jedi'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jsfaint/gen_tags.vim'
Plug 'thinca/vim-qfreplace'
Plug 'ryanoasis/vim-devicons'
Plug 'lambdalisue/gina.vim'

if has('unix') && !has('mac')
  Plug 'vim-scripts/fcitx.vim'
endif
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" edit Utility -------------------------
Plug 'Yggdroot/indentLine'
Plug 'elzr/vim-json'
Plug 'pearofducks/ansible-vim'
Plug 'vim-scripts/gitignore.vim'
Plug 'junegunn/vim-emoji'
Plug '13k/vim-nginx'
Plug 'chrisbra/Colorizer'
Plug 'glidenote/memolist.vim'
Plug 'fuenor/qfixgrep'
Plug 'leafgarland/typescript-vim'
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/lista.nvim'

" Syntax -------------------------------
Plug 'hashivim/vim-terraform'
Plug 'hdima/python-syntax'
Plug 'aklt/plantuml-syntax'
Plug 'mechatroner/rainbow_csv'

call plug#end()
