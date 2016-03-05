"      ___           ___                                      ___
"     /  /\         /  /\           ___         ___          /  /\
"    /  /:/        /  /::|         /__/\       /__/\        /  /::\
"   /  /:/        /  /:|:|         \__\:\      \  \:\      /  /:/\:\
"  /  /:/        /  /:/|:|__       /  /::\      \__\:\    /  /::\ \:\
" /__/:/     /\ /__/:/ |:| /\   __/  /:/\/      /  /::\  /__/:/\:\ \:\
" \  \:\    /:/ \__\/  |:|/:/  /__/\/:/~~      /  /:/\:\ \  \:\ \:\_\/
"  \  \:\  /:/      |  |:/:/   \  \::/        /  /:/__\/  \  \:\ \:\
"   \  \:\/:/       |__|::/     \  \:\       /__/:/        \  \:\_\/
"    \  \::/        /__/:/       \__\/       \__\/          \  \:\
"     \__\/         \__\/                                    \__\/
"
let g:unite_source_history_yank_enable = 1
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry

" The prefix key. -------------------------------------
nnoremap    [unite]   <Nop>
nmap    <space> [unite]

" nnoremap [unite]u  :<C-u>Unite<Space>
" nnoremap <silent> [unite]a  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
" nnoremap <silent> [unite]f  :<C-u>Unite -buffer-name=files file<CR>
" nnoremap <silent> [unite]b  :<C-u>Unite buffer<CR>
" nnoremap <silent> [unite]m  :<C-u>Unite file_mru<CR>
" search a file in the filetree
nnoremap <space><space> :split<cr> :<C-u>Unite -start-insert file_rec/async<cr>
" reset not it is <C-l> normally
:nnoremap <space>r <Plug>(unite_restart)

" autocmd FileType unite call s:unite_my_settings()
" function! s:unite_my_settings()"{{{
  " " Overwrite settings. ------------------------
  " imap <buffer> jj      <Plug>(unite_insert_leave)
  " nnoremap <silent><buffer> <C-k> :<C-u>call unite#mappings#do_action('preview')<CR>
  " imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
  " " Start insert. ------------------------------
  " let g:unite_enable_start_insert = 1
" endfunction"}}}

let g:unite_source_file_mru_limit = 200

