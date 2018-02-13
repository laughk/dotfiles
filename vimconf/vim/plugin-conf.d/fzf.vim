"" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use pt instead of ag:
command! -bang -nargs=* Pt
  \ call fzf#vim#grep(
  \   'pt --color --ignore="venv*/" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:wrap', '?'),
  \   <bang>0)


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
