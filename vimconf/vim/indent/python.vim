if exists('b:did_indent')
  finish
endif

setlocal autoindent
setlocal expandtab
setlocal indentkeys=!^F,o,O
setlocal shiftwidth=4
setlocal smartindent
" setlocal cinwords=if, elif, else, for, while, try, except, finally, def, class
setlocal softtabstop=4


let b:did_indent=1
