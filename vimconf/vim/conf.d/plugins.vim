" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" MiniBufExplorer
" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" hjklで移動
let g:miniBufExplMapWindowNavVim=1
" Put new window above
let g:miniBufExplSplitBelow=0
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
let g:miniBufExplSplitToEdge=1
let g:miniBufExplMaxSize = 10

":TmでMiniBufExplorerの表示トグル
command! Mt :TMiniBufExplorer

" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" NERD_commenter.vim
" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" コメントの間にスペースを空ける
let NERDSpaceDelims = 1
"<Leader>xでコメントをトグル(NERD_commenter.vim)
" map <Leader>x, c<space>
"未対応ファイルタイプのエラーメッセージを表示しない
let NERDShutUp=1

" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" BufExplorer
" ++++++++++++++++++++++++++++++++++++++++++++++++++++
""<Leader>l<Space>でBufferList
nnoremap <Leader>l<Space> :BufExplorer<CR>

" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" neocomplecache.vim
" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" 基本設定 -------------------------------------------------------
let g:acp_enableAtStartup = 0                         "| AutoComplPopを無効にする
let g:neocomplete#enable_at_startup = 1               "| neocomplteを有効にする
let g:neocomplete#enable_smart_case = 1               "| smarrt case有効化。 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_camel_case_completion = 1    "| camle caseを有効化。大文字を区切りとしたワイルドカードのように振る舞う
let g:neocomplete#enable_underbar_completion = 1      "| _(アンダーバー)区切りの補完を有効化
let g:neocomplete#source#syntax#min_syntax_length = 3 "| シンタックスをキャッシュするときの最小文字長を3に
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*' "| neocomplcacheを自動的にロックするバッファ名のパターン

" Define dictionary. -------------------------------------------
let g:neocomplete#source#dictionary#dictionaries = {
  \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scala' : $HOME.'/.vim/bundle/vim-scala/dict/scala.dict',
  \ 'java' : $HOME.'/.vim/dict/java.dict',
  \ 'c' : $HOME.'/.vim/dict/c.dict',
  \ 'cpp' : $HOME.'/.vim/dict/cpp.dict',
  \ 'javascript' : $HOME.'/.vim/dict/javascript.dict',
  \ 'ocaml' : $HOME.'/.vim/dict/ocaml.dict',
  \ 'perl' : $HOME.'/.vim/dict/perl.dict',
  \ 'php' :  $HOME.'/.vim/dict/php.dict',
  \ 'scheme' : $HOME.'/.vim/dict/scheme.dict',
  \ 'vm' : $HOME.'/.vim/dict/vim.dict'
\ }

" Define keyword. -----------------------------------------------
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" 補完を選択しpopupを閉じる
inoremap <expr><C-y> neocomplete#close_popup()
" 補完をキャンセルしpopupを閉じる
inoremap <expr><C-e> neocomplete#cancel_popup()
" TABで補完できるようにする
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" undo
inoremap <expr><C-g> neocomplete#undo_completion()
" 補完候補の共通部分までを補完する
inoremap <expr><C-l> neocomplete#complete_common_string()
" C-kを押すと行末まで削除
inoremap <C-k> <C-o>D
" C-nでneocomplcache補完
inoremap <expr><C-n> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
" C-pでkeyword補完
inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
" 補完候補が出ていたら確定、なければ改行
inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() : "<CR>"

" FileType毎のOmni補完を設定
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType htmlcheetah set omnifunc=htmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#source#omni#input_patterns')
  let g:neocomplete#source#omni#input_patterns = {}
endif
let g:neocomplete#source#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#source#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" neosnippet.vim
" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" ユーザー定義スニペット保存ディレクトリ -----------------------
let g:neosnippet#snippets_directory = $HOME.'/.vim/snippets'

" " スニペット --------------------------------------------------
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" unite.vim
" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" The prefix key. -------------------------------------
nnoremap    [unite]   <Nop>
nmap    f [unite]

nnoremap [unite]u  :<C-u>Unite<Space>
nnoremap <silent> [unite]a  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]f  :<C-u>Unite -buffer-name=files file<CR>
nnoremap <silent> [unite]b  :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]m  :<C-u>Unite file_mru<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings. ------------------------
  imap <buffer> jj      <Plug>(unite_insert_leave)
  nnoremap <silent><buffer> <C-k> :<C-u>call unite#mappings#do_action('preview')<CR>
  imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
  " Start insert. ------------------------------
  let g:unite_enable_start_insert = 1
endfunction"}}}

let g:unite_source_file_mru_limit = 200

" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" Vim-Align
" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" Alignを日本語環境で使用するための設定 -----------------------
let g:Align_xstrlen = 3

