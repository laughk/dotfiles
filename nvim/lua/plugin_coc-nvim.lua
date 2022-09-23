vim.o.updatetime = 300
-- vim.o.signcolumn = true

-- " Add (Neo)Vim's native statusline support.
-- " NOTE: Please see `:h coc-status` for integrations with external plugins that
-- " provide custom statusline: lightline.vim, vim-airline.
vim.cmd[[set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}]]


-- " Use tab for trigger completion with characters ahead and navigate.
-- " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- " other plugin before putting this into your config.
vim.api.nvim_set_keymap('i', '<silent><expr> <TAB>',
  'coc#pum#visible() ? coc#pum#next(1): CheckBackspace() ? "<Tab>" : coc#refresh()',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap('i', '<expr><S-TAB>',
  'coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"', { noremap = true, silent = true }
)

-- " Make <CR> to accept selected completion item or notify coc.nvim to format
-- " <C-g>u breaks current undo, please make your own choice.
vim.api.nvim_set_keymap('i', '<silent><expr> <CR>',
  'coc#pum#visible() ? coc#pum#confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"',
  { noremap = true, silent = true }
)

-- " Use <c-space> to trigger completion.
vim.cmd[[inoremap <silent><expr> <c-space> coc#refresh()]]

-- " Use `[g` and `]g` to navigate diagnostics
-- " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
vim.api.nvim_set_keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']g', '<Plug>(coc-diagnostic-next)', { noremap = true, silent = true })

-- " GoTo code navigation.
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { noremap = true, silent = true })

-- " Use K to show documentation in preview window.
vim.keymap.set('n', 'K', function()
  if vim.fn.CocAction('hasProvider', 'hover') == true then
    vim.fn.CocActionAsync('doHover')
  else
    vim.fn.feedkeys('K', 'in')
  end
end)

-- " Highlight the symbol and its references when holding the cursor.
vim.cmd[[autocmd CursorHold * silent call CocActionAsync('highlight')]]

-- " Symbol renaming.
vim.api.nvim_set_keymap('n', '<leader>rn', '<Plug>(coc-rename)', { noremap = true })

-- " Formatting selected code.
vim.cmd[[xmap <leader>f  <Plug>(coc-format-selected)]]
vim.api.nvim_set_keymap('n', '<leader>f', ' <Plug>(coc-format-selected)', { noremap = true })

vim.cmd[[
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
]]

-- " Applying codeAction to the selected region.
-- " Example: `<leader>aap` for current paragraph
vim.cmd[[xmap <leader>a  <Plug>(coc-codeaction-selected)]]
vim.api.nvim_set_keymap('n', '<leader>a', ' <Plug>(coc-codeaction-selected)', { noremap = true })

-- " Remap keys for applying codeAction to the current buffer.
vim.api.nvim_set_keymap('n', '<leader>ac', ' <Plug>(coc-codeaction)', { noremap = true })
-- " Apply AutoFix to problem on the current line.
vim.api.nvim_set_keymap('n', '<leader>qf', ' <Plug>(coc-fix-current)', { noremap = true })

-- " Run the Code Lens action on the current line.
vim.api.nvim_set_keymap('n', '<leader>cl', ' <Plug>(coc-codelens-action)', { noremap = true })

-- " Map function and class text objects
-- " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
vim.cmd[[xmap if <Plug>(coc-funcobj-i)]]
vim.cmd[[omap if <Plug>(coc-funcobj-i)]]
vim.cmd[[xmap af <Plug>(coc-funcobj-a)]]
vim.cmd[[omap af <Plug>(coc-funcobj-a)]]
vim.cmd[[xmap ic <Plug>(coc-classobj-i)]]
vim.cmd[[omap ic <Plug>(coc-classobj-i)]]
vim.cmd[[xmap ac <Plug>(coc-classobj-a)]]
vim.cmd[[omap ac <Plug>(coc-classobj-a)]]

-- " Remap <C-f> and <C-b> for scroll float windows/popups.
if vim.fn.has('nvim-0.4.0') then
  vim.cmd[[nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"]]
  vim.cmd[[nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"]]
  vim.cmd[[inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"]]
  vim.cmd[[inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"]]
  vim.cmd[[vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"]]
  vim.cmd[[vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"]]
end

-- " Use CTRL-S for selections ranges.
-- " Requires 'textDocument/selectionRange' support of language server.
vim.api.nvim_set_keymap('n', '<silent>', '<C-s> <Plug>(coc-range-select)', { noremap = true })
vim.cmd[[xmap <silent> <C-s> <Plug>(coc-range-select)]]

-- " Add `:Format` command to format current buffer.
vim.cmd[[command! -nargs=0 Format :call CocActionAsync('format')]]

-- " Add `:Fold` command to fold current buffer.
vim.cmd[[command! -nargs=? Fold :call     CocAction('fold', <f-args>)]]

-- " Add `:OR` command for organize imports of the current buffer.
vim.cmd[[command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')]]


-- " Mappings for CoCList
-- " Show all diagnostics.
vim.cmd[[nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>]]
-- " Manage extensions.
vim.cmd[[nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>]]
-- " Show commands.
vim.cmd[[nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>]]
-- " Find symbol of current document.
vim.cmd[[nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>]]
-- " Search workspace symbols.
vim.cmd[[nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>]]
-- " Do default action for next item.
vim.cmd[[nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>]]
-- " Do default action for previous item.
vim.cmd[[nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>]]
-- " Resume latest coc list.
vim.cmd[[nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>]]

--
-- オリジナル
-- 
vim.g.coc_filetype_map = {}
vim.g.coc_filetype_map['yaml.ansible'] = 'ansible'
