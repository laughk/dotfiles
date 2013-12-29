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
" grep.vim
" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" 検索外のディレクトリ、ファイルパターン
let Grep_Skip_Dirs = '.svn .git .hg'
let Grep_Skip_Files = '*.bak *~'

" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" surround.vim
" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" s, ssで選択範囲を指定文字でくくる
" nmap s <Plug>Ysurround  " 文字置換とキーがかぶるのでここはあとでちょっと考える。
" nmap ss <Plug>Yssurround

" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" git.vim
" ++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:git_no_map_default = 1
let g:git_command_edit = 'rightbelow vnew'
nnoremap <Space>gd :<C-u>GitDiff --cached<Enter>
nnoremap <Space>gD :<C-u>GitDiff<Enter>
nnoremap <Space>gs :<C-u>GitStatus<Enter>
nnoremap <Space>gl :<C-u>GitLog<Enter>
nnoremap <Space>gL :<C-u>GitLog -u \| head -10000<Enter>
nnoremap <Space>ga :<C-u>GitAdd<Enter>
nnoremap <Space>gA :<C-u>GitAdd <cfile><Enter>
nnoremap <Space>gc :<C-u>GitCommit<Enter>
nnoremap <Space>gC :<C-u>GitCommit --amend<Enter>
nnoremap <Space>gp :<C-u>Git push

" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" BufExplorer
" ++++++++++++++++++++++++++++++++++++++++++++++++++++
""<Leader>l<Space>でBufferList
nnoremap <Leader>l<Space> :BufExplorer<CR>

" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" VTreeExplorer
" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" let g:treeExplVertical=1
"<Leader>t<Space>でディレクトリツリー表示
noremap <Leader>t<Space> :VSTreeExplore<CR>
"分割したウィンドウのサイズ
" let g:treeExplWinSize=30

" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" vimshell
" ++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_enable_smart_case = 1

" Display user name
let g:vimshell_prompt = "[".$USER."] $ "
call vimshell#set_execute_file('bmp,jpg,png,gif', 'gexeeog')
call vimshell#set_execute_file('mp3,m4a,ogg', 'gexe  amarok')
let g:vimshell_execute_file_list['zip'] = 'zipinfo'
call vimshell#set_execute_file('tgz,gz', 'gzcat')
call vimshell#set_execute_file('tbz,bz2', 'bzcat')

function! g:my_chpwd(args, context)
  call vimshell#execute('echo "chpwd"')
endfunction
function! g:my_emptycmd(cmdline, context)
  call vimshell#execute('echo "emptycmd"')
  return a:cmdline
endfunction
function! g:my_preprompt(args, context)
  call vimshell#execute('echo "preprompt"')
endfunction
function! g:my_preexec(cmdline, context)
  call vimshell#execute('echo "preexec"')

  if a:cmdline =~# '^\s*diff\>'
    call vimshell#set_syntax('diff')
  endif
  return a:cmdline
endfunction

autocmd FileType vimshell
\ call vimshell#altercmd#define('g','git')
\| call vimshell#altercmd#define('i','iexe')
\| call vimshell#altercmd#define('l','ll')
\| call vimshell#altercmd#define('ll','ls -l')
\| call vimshell#hook#set('emptycmd',['g:my_emptycmd'])
\| call vimshell#hook#set('preexec',['g:my_preexec'])

command! Vs :VimShell

" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" neocomplecache.vim
" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" 基本設定 -------------------------------------------------------
let g:neocomplcache_enable_at_startup = 1               "| NeoComplCacheを有効にする
let g:neocomplcache_enable_smart_case = 1               "| smarrt case有効化。 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_camel_case_completion = 1    "| camle caseを有効化。大文字を区切りとしたワイルドカードのように振る舞う
let g:neocomplcache_enable_underbar_completion = 1      "| _(アンダーバー)区切りの補完を有効化
let g:neocomplcache_min_syntax_length = 3               "| シンタックスをキャッシュするときの最小文字長を3に
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*' "| neocomplcacheを自動的にロックするバッファ名のパターン
let g:neocomplcache_enable_auto_select = 1              "| 補完候補の一番先頭を選択状態にする(AutoComplPopと似た動作)

" Define dictionary. -------------------------------------------
let g:neocomplcache_dictionary_filetype_lists = {
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
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
  let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" ユーザー定義スニペット保存ディレクトリ -----------------------
let g:neocomplcache_snippets_dir = $HOME.'/.vim/snippets'

" スニペット --------------------------------------------------
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)

" 補完を選択しpopupを閉じる
inoremap <expr><C-y> neocomplcache#close_popup()
" 補完をキャンセルしpopupを閉じる
inoremap <expr><C-e> neocomplcache#cancel_popup()
" TABで補完できるようにする
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" undo
inoremap <expr><C-g> neocomplcache#undo_completion()
" 補完候補の共通部分までを補完する
inoremap <expr><C-l> neocomplcache#complete_common_string()
" C-kを押すと行末まで削除
inoremap <C-k> <C-o>D
" C-nでneocomplcache補完
inoremap <expr><C-n> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
" C-pでkeyword補完
inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
" 補完候補が出ていたら確定、なければ改行
inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "<CR>"

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
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

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

" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" Pydiction
" ++++++++++++++++++++++++++++++++++++++++++++++++++++
"  辞書ファイルの場所を指定
let g:pydiction_location = $HOME.'/.vim/bundle/Pydiction/complete-dict'

" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" indent-guides
" ++++++++++++++++++++++++++++++++++++++++++++++++++++
"  インデントのハイライトをデフォルトでONにする。
let g:indent_guides_enable_on_vim_startup = 1
"  インデントを少しカスタム
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" errormarker
" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" キーバインドカスタム ------------------------------------
" nmap <silent> <unique> <Leader>ee :ErrorAtCursor<CR>

" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" Mojo.vim
" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" pl,pmファイルの__DATA__ 箇所のハイライトを有効化
:let mojo_highlight_data = 1

" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" Markdonw (vim-ft-markdown_fold)
" ++++++++++++++++++++++++++++++++++++++++++++++++++++
" *.md でMarkdonwと認識させる
autocmd BufNewFile,BufRead *.md set ft=markdown
