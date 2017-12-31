" 色に関する設定
" ------------------------------------------------------------------------
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

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

colorscheme breezy
let python_highlight_all=1
