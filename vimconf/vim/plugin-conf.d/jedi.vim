" deoplete jedi
let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python'

" docstringは表示しない
autocmd FileType python setlocal completeopt-=preview

" 勝手にキーバインド設定やら自動補完などをやるので潰しておく
let g:jedi#auto_initialization = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#completions_enabled = 0
" コード参照のキーバインドを登録
let g:jedi#goto_command = "<Leader>d"
