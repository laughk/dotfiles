" 検索に関する設定
" ------------- + ----------------------------------------
set wrapscan   "| 最後まで検索したら先頭へ戻る
set ignorecase "| 大文字小文字無視
set smartcase  "| 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch  "| インクリメンタルサーチ
set hlsearch   "| 検索文字をハイライト

"Escの2回押しでハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>
