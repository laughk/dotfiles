let g:lsp_log_file = expand('~/.cache/tmp/vim-lsp.log')  " ログ出力のPATHを設定
"
" For bingo(go language server)
if (executable('bingo'))
    augroup LspGo
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'bingo',
          \ 'cmd': {server_info->['bingo', '-mode', 'stdio']},
          \ 'whitelist': ['go'],
          \ })
        nmap <silent> <Leader>d :LspDefinition<CR>
        nmap <silent> K  :LspHover<CR>
        nmap <silent> <Leader>s :LspDocumentSymbol<CR>
    augroup END
endif
