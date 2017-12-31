let g:memolist_memo_suffix = "rst"
let g:memolist_qfixgrep = 1
let g:memolist_template_dir_path = "~/.dotfiles/vimconf/memotemplates"

nnoremap <Leader>mn  :MemoNew<CR>
nnoremap <Leader>ml  :MemoList<CR>
nnoremap <Leader>mg  :MemoGrep<CR>


command! -nargs=* -bang Vimgrep     call <SID>QFixCmdGrep('Vimgrep', <q-args>)
command! -nargs=* -bang VGrep       call <SID>QFixCmdGrep('Vimgrep', <q-args>)
