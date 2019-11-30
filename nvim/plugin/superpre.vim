"Hatena super pre highlight
function! HatenaSuperPreHighlight()
  let ft = expand('%:e')
  if ft == 'txt' || ft == 'howm' || ft == 'howm_memo'
    let ft = 'qfix_memo'
  endif
  if &filetype != ft
    exec 'setlocal filetype='.ft
    return
  endif
  let sl = search('^>|.\+|$', 'ncbW')
  if sl == 0
    let sl = search('^>|.\+|$', 'ncW')
  endif
  if sl != 0
    let ft = getline(sl)
    let ft = substitute(ft, '[>|]', '', 'g')
    exec 'setlocal filetype='.ft
    return
  endif
endfunction