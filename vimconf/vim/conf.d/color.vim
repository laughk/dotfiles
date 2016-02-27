" 色に関する設定
" ------------------------------------------------------------------------
" 256色を有効に。
set t_Co=256

" ハイライト on
syntax enable

" カラースキーム
" let g:solarized_termtrans = 1
" let g:solarized_termcolors = 256

if has('gui_running')
  set background=light
else
  set background=dark
endif

colorscheme seoul256
