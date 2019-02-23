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
" let g:jedi#goto_command = '<Leader>'
"
nnoremap <Leader>d  :call jedi#goto()<CR>

" for ale
" from https://qiita.com/lighttiger2505/items/9a36c5b4035dd469134c

" flake8をLinterとして登録
let g:ale_linters = {
    \ 'python': ['flake8'],
    \ }

" 各ツールをFixerとして登録
" let g:ale_fixers = {
"     \ 'python': ['autopep8', 'black', 'isort'],
"     \ }
" 
" 各ツールの実行オプションを変更してPythonパスを固定
let g:ale_python_flake8_executable = g:python3_host_prog
let g:ale_python_flake8_options = '-m flake8'
" let g:ale_python_autopep8_executable = g:python3_host_prog
" let g:ale_python_autopep8_options = '-m autopep8'
" let g:ale_python_isort_executable = g:python3_host_prog
" let g:ale_python_isort_options = '-m isort'
" let g:ale_python_black_executable = g:python3_host_prog
" let g:ale_python_black_options = '-m black'
