" vim-plug の自動インストールと
" vim-plug自身にvim-plugを管理させる
" ref.
"   - http://qiita.com/jiminko/items/f4b337ab41db751388f7
if has('vim_starting')
  set rtp+=~/.config/nvim/plugged/vim-plug
  if !isdirectory(expand('~/.config/nvim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call mkdir(expand('~/.config/nvim/plugged'), 'p')
    call system('git clone https://github.com/junegunn/vim-plug.git '. $HOME .'/.config/nvim/plugged/vim-plug/autoload')
  end
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/vim-plug', {'dir': '~/.config/nvim/plugged/vim-plug/autoload'}

" Text Format -------------------------
Plug 'vim-scripts/Align'
Plug 'tpope/vim-surround'
Plug 'mattn/vim-sqlfmt'
Plug 'mattn/vim-goimports'

" Color Scheme ------------------------
" Plug 'lsdr/monokai'
" Plug 'iCyMind/NeoSolarized'
" Plug 'junegunn/seoul256.vim'
" Plug 'AlessandroYorba/Alduin'
" Plug 'davidklsn/vim-sialoquent'
" Plug 'trevordmiller/nova-vim'
" Plug 'fneu/breezy'
Plug 'arcticicestudio/nord-vim'
" Plug 'cocopon/iceberg.vim'
Plug 'wadackel/vim-dogrun'

" Develop Tool ------------------------
Plug 'lambdalisue/gina.vim'  " git client for vim
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'w0rp/ale'
Plug 'Vimjas/vim-python-pep8-indent', {'for': ['python', 'python3']}
Plug 'jsfaint/gen_tags.vim'
Plug 'thinca/vim-quickrun'
Plug 'tyru/open-browser-github.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'

" Normal Utility ----------------------
Plug 'cocopon/vaffle.vim'    " filer for vim
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'thinca/vim-qfreplace'
Plug 'tyru/open-browser.vim'

if has('unix') && !has('mac') && !has('WSL')
  Plug 'vim-scripts/fcitx.vim'
endif

" edit Utility -------------------------
Plug 'chrisbra/Colorizer'
Plug 'junegunn/vim-emoji'
Plug 'kannokanno/previm'
Plug 'nathanaelkane/vim-indent-guides'

" Syntax -------------------------------
Plug 'aklt/plantuml-syntax'
Plug 'ap/vim-css-color'
Plug 'hashivim/vim-terraform'
Plug 'hdima/python-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'mechatroner/rainbow_csv'
Plug 'pearofducks/ansible-vim'
Plug 'posva/vim-vue'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-scripts/gitignore.vim'

call plug#end()
