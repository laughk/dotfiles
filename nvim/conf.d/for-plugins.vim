"  plugin-conf.d/align.vim 
" ===================================
"       ___           ___                   ___           ___
"      /\  \         /\__\      ___        /\  \         /\__\
"     /::\  \       /:/  /     /\  \      /::\  \       /::|  |
"    /:/\:\  \     /:/  /      \:\  \    /:/\:\  \     /:|:|  |
"   /::\~\:\  \   /:/  /       /::\__\  /:/  \:\  \   /:/|:|  |__
"  /:/\:\ \:\__\ /:/__/     __/:/\/__/ /:/__/_\:\__\ /:/ |:| /\__\
"  \/__\:\/:/  / \:\  \    /\/:/  /    \:\  /\ \/__/ \/__|:|/:/  /
"       \::/  /   \:\  \   \::/__/      \:\ \:\__\       |:/:/  /
"       /:/  /     \:\  \   \:\__\       \:\/:/  /       |::/  /
"      /:/  /       \:\__\   \/__/        \::/  /        /:/  /
"      \/__/         \/__/                 \/__/         \/__/
"
" Alignを日本語環境で使用するための設定 -----------------------
let g:Align_xstrlen = 3


"  plugin-conf.d/css-color.vim 
" ===================================
let g:cssColorVimDoNotMessMyUpdatetime = 1

"  plugin-conf.d/deoplete-jedi.vim 
" ===================================
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'

"  plugin-conf.d/devicons.vim 
" ===================================
" フォルダアイコンの表示をON
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

"  plugin-conf.d/fzf.vim 
" ===================================
"" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use pt instead of ag:
command! -bang -nargs=* Pt
  \ call fzf#vim#grep(
  \   'pt --color --ignore="venv*/" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:wrap', '?'),
  \   <bang>0)


nnoremap [fzf] <Nop>
nmap f [fzf]
" find file (for gir repository)
nnoremap <silent> [fzf]G :GitFiles<CR>
" find file
nnoremap <silent> [fzf]f :Files<CR>
" show buffer
nnoremap <silent> [fzf]b :Buffers<CR>
" search file
nnoremap <silent> [fzf]s :Pt<CR>
" ctag
nnoremap <silent> [fzf]t :Tags<CR>

"  plugin-conf.d/gen_tags.vim 
" ===================================
let g:gen_tags#ctags_auto_gen = 1
let g:gen_tags#gtags_auto_gen = 1

"  plugin-conf.d/gina.vim 
" ===================================
nnoremap Gs :Gina status<CR>

call gina#custom#command#option(
      \ 'commit', '-v|--verbose'
      \)

call gina#custom#mapping#nmap(
      \ 'status', '<C-^>',
      \ ':<C-u>Gina commit<CR>',
      \ {'noremap': 1, 'silent': 1}
      \)


"  plugin-conf.d/gtags.vim 
" ===================================
" Options
let g:Gtags_Auto_Map = 0
let g:Gtags_OpenQuickfixWindow = 1

map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>

"  plugin-conf.d/indentline.vim 
" ===================================
let g:indentLine_char = '|'

"  plugin-conf.d/jedi.vim 
" ===================================
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
"nnoremap <Leader>d  :call jedi#goto()<CR>

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

"  plugin-conf.d/lightline.vim 
" ===================================
let g:lightline = {
    \ 'colorscheme': 'sialoquent',
    \ 'active': {
    \   'left': [ ['mode', 'paste' ],
    \             [ 'fugitive', 'virtualenv', 'filename', 'readonly' ],
    \             [ 'ale' ] ],
    \ },
    \ 'component_function': {
    \   'readonly': 'LightLineReadonly',
    \   'modified': 'LightLineModified',
    \   'fugitive': 'LightLineFugitive',
    \   'virtualenv': 'LightLineActiveVirtualenv',
    \   'filename': 'LightLineFilename',
    \   'ale': 'ALEGetStatusLine',
    \ },
    \ 'separetor': { 'left': '', 'right': ''},
    \ 'subseparator': { 'left': '|', 'right': '|' },
\}


" for `git status`
function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? "\ue0a0 "._ : ''
  endif
  return ''
endfunction

" for virtualenv
function! LightLineActiveVirtualenv()
  if $VIRTUAL_ENV != ''
    let s:virtualenv_dict = split($VIRTUAL_ENV, '/')
    return "🐍 ".s:virtualenv_dict[-1]
  endif
  return ''
endfunction

" for readonly
function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '\ue0a2' : ''
endfunction

" for modified
function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

" for file path
function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
    \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
    \  &ft == 'unite' ? unite#get_status_string() :
    \  &ft == 'vimshell' ? vimshell#get_status_string() :
    \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
    \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

" for Ale Status
function! ALEStatus()
  return ALEGetStatusLine()
endfunction

"  plugin-conf.d/neocomple.vim 
" ===================================
"  _        _______  _______  _______  _______  _______  _______  _        _______
" ( (    /|(  ____ \(  ___  )(  ____ \(  ___  )(       )(  ____ )( \      (  ____ \
" |  \  ( || (    \/| (   ) || (    \/| (   ) || () () || (    )|| (      | (    \/
" |   \ | || (__    | |   | || |      | |   | || || || || (____)|| |      | (__
" | (\ \) ||  __)   | |   | || |      | |   | || |(_)| ||  _____)| |      |  __)
" | | \   || (      | |   | || |      | |   | || |   | || (      | |      | (
" | )  \  || (____/\| (___) || (____/\| (___) || )   ( || )      | (____/\| (____/\
" |/    )_)(_______/(_______)(_______/(_______)|/     \||/       (_______/(_______/
"
"
set completeopt+=noinsert

" 基本設定 -------------------------------------------------------
let g:deoplete#enable_at_startup = 1               "| neocomplteを有効にする
let g:deoplete#enable_smart_case = 1               "| smarrt case有効化。 大文字が入力されるまで大文字小文字の区別を無視する
let g:deoplete#enable_camel_case_completion = 1    "| camle caseを有効化。大文字を区切りとしたワイルドカードのように振る舞う
let g:deoplete#enable_underbar_completion = 1      "| _(アンダーバー)区切りの補完を有効化

" TABで補完できるようにする
imap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Shift-TAB で戻る
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

" Define keyword. -----------------------------------------------
if !exists('g:deoplete#keyword_patterns')
  let g:deoplete#keyword_patterns = {}
endif
  let g:deoplete#keyword_patterns['default'] = '\h\w*'

" " 補完を選択しpopupを閉じる
inoremap <expr><C-y> deoplete#mappings#close_popup()
" undo
inoremap <expr><C-g> deoplete#mappings#undo_completion()
" 補完候補の共通部分までを補完する
inoremap <expr><C-l> deoplete#complete_common_string()
" C-kを押すと行末まで削除
inoremap <C-k> <C-o>D
" C-nでdeoplete補完
inoremap <expr><C-n> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
" C-pでkeyword補完
inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
" 補完候補が出ていたら確定、なければ改行
inoremap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "<CR>"

" FileType毎のOmni補完を設定
autocmd FileType python set omnifunc=jedi#completions
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType htmlcheetah set omnifunc=htmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:deoplete#source#omni#input_patterns')
  let g:deoplete#source#omni#input_patterns = {}
endif
let g:deoplete#source#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:deoplete#source#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:deoplete#source#omni#input_patterns.python = ''

"  plugin-conf.d/nerdcommenter.vim 
" ===================================
"  _   _  _________________                                         _
" | \ | ||  ___| ___ \  _  \                                       | |
" |  \| || |__ | |_/ / | | |___ ___  _ __ ___  _ __ ___   ___ _ __ | |_ ___ _ __
" | . ` ||  __||    /| | | / __/ _ \| '_ ` _ \| '_ ` _ \ / _ \ '_ \| __/ _ \ '__|
" | |\  || |___| |\ \| |/ / (_| (_) | | | | | | | | | | |  __/ | | | ||  __/ |
" \_| \_/\____/\_| \_|___/ \___\___/|_| |_| |_|_| |_| |_|\___|_| |_|\__\___|_|
"
" コメントの間にスペースを空ける
let NERDSpaceDelims = 1
"<Leader>xでコメントをトグル(NERD_commenter.vim)
" map <Leader>x, c<space>
"未対応ファイルタイプのエラーメッセージを表示しない
let NERDShutUp=1

"  plugin-conf.d/nerdtess.vim 
" ===================================
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let NERDTreeIgnore = ['\.pyc$']

map <Leader>n :NERDTreeToggle<CR>

"  plugin-conf.d/vim-buffergator.vim 
" ===================================
nnoremap gt :bnext<CR>
nnoremap Gt :bprev<CR>

let g:buftabline_numbers = 1

"  plugin-conf.d/vim-emoji.vim 
" ===================================
" from:
"   https://github.com/junegunn/vim-emoji/blob/master/README.md
" ----------------------------------------------------------------------
silent! if emoji#available()
  let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
  let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
  let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
  let g:gitgutter_sign_modified_removed = emoji#for('collision')
endif

set completefunc=emoji#complete

"  plugin-conf.d/vim-json.vim 
" ===================================
let g:vim_json_syntax_conceal = 0
