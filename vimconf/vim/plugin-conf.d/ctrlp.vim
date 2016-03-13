if executable('ag')
  let g:ctrlp_use_caching=0
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup -g ""'
endif
