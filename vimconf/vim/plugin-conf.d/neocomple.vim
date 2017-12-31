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
