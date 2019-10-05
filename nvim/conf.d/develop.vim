" ログ出力のPATHを設定
" if !isdirectory(expand('~/.cache/tmp/'))
  " echo 'create a dir for saving vim-lsp.log'
  " call system('mkdir -vp ~/.cache/tmp')
" endif
" let g:lsp_log_file = expand('~/.cache/tmp/vim-lsp.log')

augroup GolangIndent
  autocmd!
  autocmd BufNewFile,BufRead *.go setlocal tabstop=4 shiftwidth=4 noexpandtab
augroup END

" For bingo(go language server)
" if executable('gopls')
    " augroup LspGo
        " autocmd!
        " au User lsp_setup call lsp#register_server({
            " \ 'name': 'go-langserver',
            " \ 'cmd': {server_info->['go-langserver', '-mode', 'stdio']},
            " \ 'whitelist': ['go'],
            " \ })
        " augroup END
        " nmap <silent> <Leader>d :LspDefinition<CR>
        " nmap <silent> K  :LspHover<CR>
        " nmap <silent> <Leader>s :LspDocumentSymbol<CR>
" endif
"

function! s:cd_git_root_dir()
    if(system('git rev-parse --is-inside-work-tree') == "true\n")
        return ':cd ' . system('git rev-parse --show-cdup') . '\<CR>'
    else
        echoerr '!!!current directory is outside git working tree!!!'
    endif
endfunction
nnoremap  <expr><Leader>G <SID>cd_git_root_dir()
