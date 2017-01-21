" deoplete jedi
let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python'

" docstringは表示しない
autocmd FileType python setlocal completeopt-=preview


" if has('python') || has('python3')
"   setlocal omnifunc=jedi#completions
" else
"   setlocal omnifunc=
" endif

" let g:jedi#auto_initialization = 1
" let g:jedi#auto_vim_configuration = 1
" let g:jedi#completions_enabled = 1
" let g:jedi#popup_on_dot = 0
" let g:jedi#show_call_signatures = 1
" let g:jedi#smart_auto_mappings = 1
" let g:jedi#use_splits_not_buffers = "left"
if has('mac') && has('python3')
  let g:jedi#force_py_version = 3
endif
