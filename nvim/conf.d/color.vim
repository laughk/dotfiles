" 色に関する設定
" ------------------------------------------------------------------------
colorscheme iceberg
set termguicolors

" ハイライト on
syntax enable

" カラースキーム
let g:neosolarized_contrast = "high"
let g:neosolarized_visibility = "high"

if has('gui_running')
  set background=light
else
  set background=dark
endif

"colorscheme nord
let python_highlight_all=1
