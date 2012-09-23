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
