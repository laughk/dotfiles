" 色に関する設定
" ------------------------------------------------------------------------
set termguicolors

" ハイライト on
syntax enable

" カラースキーム
let g:neosolarized_contrast = "high"
let g:neosolarized_visibility = "high"

colorscheme nova
if has('gui_running')
  set background=light
else
  set background=dark
endif

"colorscheme nord
let python_highlight_all=1
