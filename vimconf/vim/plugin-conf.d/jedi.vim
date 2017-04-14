" deoplete jedi
let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python'

" docstringは表示しない
autocmd FileType python setlocal completeopt-=preview
