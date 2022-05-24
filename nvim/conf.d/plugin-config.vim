"  plugin-conf.d/align.vim 
" ===================================
" Alignを日本語環境で使用するための設定 -----------------------
let g:Align_xstrlen = 3

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
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview({ 'dir': s:find_git_root() }),
  \   <bang>0)


" Similarly, we can apply it to fzf#vim#grep. To use pt instead of ag:
" https://blog.fakiyer.com/entry/2017/08/06/222936
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! -bang -nargs=* Pt
  \ call fzf#vim#grep(
  \   'pt --column --ignore=.git  --ignore="venv*/ --global-gitignore --color" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview({ 'dir': s:find_git_root() }),
  \   <bang>0)

command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir GitFiles
\ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)


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

" (deplicated) plugin-conf.d/jedi.vim  
" ===================================
" deoplete jedi
" let g:python_host_prog = '/usr/bin/python2.7'
" let g:python3_host_prog = '/usr/bin/python'

" " docstringは表示しない
" autocmd FileType python setlocal completeopt-=preview

" " 勝手にキーバインド設定やら自動補完などをやるので潰しておく
" let g:jedi#auto_initialization = 0
" let g:jedi#auto_vim_configuration = 0
" let g:jedi#smart_auto_mappings = 0
" let g:jedi#completions_enabled = 0
" let g:jedi#goto_command = '<Leader>'
"
"nnoremap <Leader>d  :call jedi#goto()<CR>

" for ale
" from https://qiita.com/lighttiger2505/items/9a36c5b4035dd469134c

" flake8をLinterとして登録
" let g:ale_linters = {
    " \ 'python': ['flake8'],
    " \ }

" 各ツールをFixerとして登録
" let g:ale_fixers = {
"     \ 'python': ['autopep8', 'black', 'isort'],
"     \ }
" 
" 各ツールの実行オプションを変更してPythonパスを固定
" let g:ale_python_flake8_executable = g:python3_host_prog
" let g:ale_python_flake8_options = '-m flake8'
" let g:ale_python_autopep8_executable = g:python3_host_prog
" let g:ale_python_autopep8_options = '-m autopep8'
" let g:ale_python_isort_executable = g:python3_host_prog
" let g:ale_python_isort_options = '-m isort'
" let g:ale_python_black_executable = g:python3_host_prog
" let g:ale_python_black_options = '-m black'

"  plugin-conf.d/lightline.vim 
" ===================================
let g:lightline = {
    \ 'colorscheme': 'dogrun',
    \ 'active': {
    \   'left': [ ['mode', 'paste' ],
    \             [ 'cocstatus', 'fugitive', 'virtualenv', 'filename', 'readonly' ],
    \             [ 'ale' ] ],
    \ },
    \ 'component_function': {
    \   'cocstatus': 'coc#status',
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

"  plugin-conf.d/nerdcommenter.vim 
" ===================================
" コメントの間にスペースを空ける
let NERDSpaceDelims = 1
"<Leader>xでコメントをトグル(NERD_commenter.vim)
" map <Leader>x, c<space>
"未対応ファイルタイプのエラーメッセージを表示しない
let NERDShutUp=1

" Vaffle
" ======================================
let g:vaffle_auto_cd = 1
let g:vaffle_open_selected_split_position = 'rightbelow'
let g:vaffle_open_selected_vsplit_position = 'rightbelow'

nnoremap vf :Vaffle<CR>

function! s:customize_vaffle_mappings() abort
  " Customize key mappings here
  nmap <buffer> <Bslash> <Plug>(vaffle-open-root)
  nmap <buffer> K        <Plug>(vaffle-mkdir)
  nmap <buffer> N        <Plug>(vaffle-new-file)
  nmap <buffer> so       <Plug>(vaffle-open-selected-split)
  nmap <buffer> vo       <Plug>(vaffle-open-selected-vsplit)
endfunction

augroup vimrc_vaffle
  autocmd!
  autocmd FileType vaffle call s:customize_vaffle_mappings()
augroup END


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

" coc.nvim
" =======================================================
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" vim rest console
" =================================
let s:vrc_auto_format_response_patterns = {
  \ 'json': 'python -m json.tool',
\}
let g:vrc_output_buffer_name = '__VRC_OUTPUT.json'
let g:vrc_curl_opts = {
  \ '-i':''
\}
