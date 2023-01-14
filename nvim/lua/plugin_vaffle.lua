local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap("", "vf", ":Vaffle<CR>", { noremap=true })

vim.cmd[[let g:vaffle_auto_cd = 1]]
vim.cmd[[let g:vaffle_open_selected_split_position = 'rightbelow']]
vim.cmd[[let g:vaffle_open_selected_vsplit_position = 'rightbelow']]

-- Vaffle を開いたときのみに使うキーバインド設定
-- Todo: lua で書く
vim.cmd[[
function! s:customize_vaffle_mappings() abort
  " Customize key mappings here
  nmap <buffer> <Bslash> <Plug>(vaffle-open-root)
  nmap <buffer> K        <Plug>(vaffle-mkdir)
  nmap <buffer> N        <Plug>(vaffle-new-file)
  nmap <buffer> so       <Plug>(vaffle-open-selected-split)
  nmap <buffer> vo       <Plug>(vaffle-open-selected-vsplit)
endfunction

augroup vimrc_vaffle
  autocmd!
  autocmd FileType vaffle call s:customize_vaffle_mappings()
augroup END
]]
