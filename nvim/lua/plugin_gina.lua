vim.cmd[[
nnoremap Gs :Gina status<CR>

call gina#custom#command#option(
      \ 'commit', '-v|--verbose'
      \)

call gina#custom#mapping#nmap(
      \ 'status', '<C-^>',
      \ ':<C-u>Gina commit<CR>',
      \ {'noremap': 1, 'silent': 1}
      \)
]]
