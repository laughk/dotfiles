let g:ctrlp_cmd = 'CtrlPCurFile'

if executable('pt')
  let g:ctrlp_use_caching=0
  let g:ctrlp_user_command = 'pt %s -i --nocolor --nogroup -g ""'
endif
