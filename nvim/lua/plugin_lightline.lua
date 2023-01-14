vim.cmd[[

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

]]
