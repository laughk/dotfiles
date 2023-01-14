-- Todo: lua で書く

-- "" Command for git grep
-- " - fzf#vim#grep(command, with_column, [options], [fullscreen])
vim.cmd[[
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview({ 'dir': s:find_git_root() }),
  \   <bang>0)

]]


-- keybind
vim.cmd[[

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
]]
