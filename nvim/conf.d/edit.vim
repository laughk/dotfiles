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

" 検索に関する設定
" --------------------------------------------------------
set wrapscan   "| 最後まで検索したら先頭へ戻る
set ignorecase "| 大文字小文字無視
set smartcase  "| 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch  "| インクリメンタルサーチ
set hlsearch   "| 検索文字をハイライト

"Escの2回押しでハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>

" 選択範囲を検索
" visualmod で z/, z?
" see http://vim-jp.org/vim-users-jp/2009/08/31/Hack-65.html
vnoremap \ <ESC>/\%V<CR>
"vnoremap \ <ESC>?\%V<CR>
" カーソル移動に関する設定
" -----------------------------------------------------------

" 0, 9で行頭、行末へ
nmap 1 0
nmap 0 ^
nmap 9 $

" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" 対応する括弧に移動
nnoremap [ %
nnoremap ] %

" カーソル位置の単語をyankする
nnoremap vy vawy

" 矩形選択で自由に移動する
set virtualedit+=block

"ビジュアルモード時vで行末まで選択
vnoremap v $h
