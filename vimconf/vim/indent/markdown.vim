if exists('b:did_indent')
  finish
endif

setlocal autoindent
setlocal indentkeys=!^F,o,O

setlocal expandtab
setlocal softtabstop=4
setlocal shiftwidth=4


let b:did_indent=1
