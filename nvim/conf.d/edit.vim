" 編集に関する設定
" -----------------------------------------------------------------
set smartindent "| 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
set cindent     "| Cプログラムファイルの自動インデントを始める

" softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set tabstop=4 shiftwidth=2 softtabstop=0

" 基本的には soft tab を使いたい
set expandtab

" insertモードを抜けるとIMEオフ
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" XMLの閉タグを自動挿入
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
augroup END

" 保存時に行末の空白を除去する
if ! &filetype=='markdown'
  autocmd BufWritePre * :%s/\s\+$//ge
endif
