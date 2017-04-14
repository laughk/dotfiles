if executable('pt')
  let g:ackprg = 'pt -i --nocolor --ignore="venv*/" --ignore=".git/"'
endif
