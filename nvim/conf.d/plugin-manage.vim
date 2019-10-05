" vim-plug の自動インストールと
" vim-plug自身にvim-plugを管理させる
" ref.
"   - http://qiita.com/jiminko/items/f4b337ab41db751388f7
if has('vim_starting')
  set rtp+=~/.config/nvim/plugged/vim-plug
  if !isdirectory(expand('~/.config/nvim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -vp ~/.config/nvim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.config/nvim/plugged/vim-plug/autoload')
  end
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug', {'dir': '~/.vim/plugged/vim-plug/autoload'}

" Text Format -------------------------
Plug 'vim-scripts/Align'

" Color Scheme ------------------------
Plug 'lsdr/monokai'
Plug 'iCyMind/NeoSolarized'
Plug 'junegunn/seoul256.vim'
Plug 'AlessandroYorba/Alduin'
Plug 'davidklsn/vim-sialoquent'
Plug 'trevordmiller/nova-vim'
Plug 'fneu/breezy'
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'

" Python -----------------------------
Plug 'w0rp/ale'
Plug 'davidhalter/jedi-vim'
Plug 'Vimjas/vim-python-pep8-indent', {'for': ['python', 'python3']}

" Develop Tool ------------------------
Plug 'diepm/vim-rest-console'

" Normal Utility ----------------------
Plug 'LeafCage/yankround.vim'
Plug 'ap/vim-css-color'
Plug 'cocopon/vaffle.vim'
Plug 'corntrace/bufexplorer'
Plug 'itchyny/lightline.vim'
Plug 'jsfaint/gen_tags.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'kannokanno/previm'
Plug 'lambdalisue/gina.vim'
Plug 'mattn/vim-sqlfmt'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'thinca/vim-qfreplace'
Plug 'thinca/vim-quickrun'
Plug 'thinca/vim-ref'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tyru/open-browser-github.vim'
Plug 'tyru/open-browser.vim'

if has('unix') && !has('mac')
  Plug 'vim-scripts/fcitx.vim'
endif

" edit Utility -------------------------
Plug 'nathanaelkane/vim-indent-guides'
Plug 'elzr/vim-json'
Plug 'vim-scripts/gitignore.vim'
Plug 'junegunn/vim-emoji'
Plug '13k/vim-nginx'
Plug 'chrisbra/Colorizer'
Plug 'leafgarland/typescript-vim'
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/lista.nvim'

" Syntax -------------------------------
Plug 'hashivim/vim-terraform'
Plug 'hdima/python-syntax'
Plug 'aklt/plantuml-syntax'
Plug 'mechatroner/rainbow_csv'
Plug 'pearofducks/ansible-vim'
Plug 'posva/vim-vue'

call plug#end()
