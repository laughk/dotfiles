" docstringは表示しない
" autocmd FileType python setlocal completeopt-=preview
"

if has('python') || has('python3') |
  setlocal omnifunc=jedi#completions |
else |
  setlocal omnifunc= |
endif
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = 0

let g:jedi#force_py_version=3
let g:jedi#use_splits_not_buffers = "left"
