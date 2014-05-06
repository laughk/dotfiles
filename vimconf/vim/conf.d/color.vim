" 色に関する設定
" ------------------------------------------------------------------------
" 256色を有効に。
set t_Co=256
" Gnome-Terminal で Italic フォントの挙動がおかしい対策
if &term == 'xterm-256color' || &term == 'screen-256color'
  set term=rxvt-unicode-256color
endif

" ハイライト on
syntax enable

" カラースキーム
let g:solarized_termtrans = 1
" let g:solarized_termcolors = 256

if has('gui_running')
  set background=light
else
  set background=dark
endif

colorscheme solarized

" GnomeTerminalなどのLinuxCUI環境で背景が半透明にならない対策
" solarized の場合は不要
" if has('unix')
  " hi Normal ctermbg=none
  " hi NonText ctermbg=none
" endif

