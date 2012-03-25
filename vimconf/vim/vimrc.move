
" 0, 9で行頭、行末へ ----------------------------------------
nmap 1 0
nmap 0 ^
nmap 9 $

" spaceで次のbufferへ。back-spaceで前のbufferへ -------------
nmap <Space> ;MBEbn<CR>
nmap <BS> ;MBEbp<CR>

" F2で前のバッファ ------------------------------------------
map <F2> <ESC>;bp<CR>
" F3で次のバッファ ------------------------------------------
map <F3> <ESC>;bn<CR>
" F4でバッファを削除する ------------------------------------
map <F4> <ESC>;bw<CR>

" フレームサイズを怠惰に変更する ----------------------------
" map <kPlus> <C-W>+
" map <kMinus> <C-W>-

" 前回終了したカーソル行に移動 ------------------------------
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" 最後に編集された位置に移動 --------------------------------
" nnoremap gb '[
" nnoremap gp ']

" 対応する括弧に移動 ----------------------------------------
nnoremap [ %
nnoremap ] %

" 最後に変更されたテキストを選択する ------------------------
" nnoremap gc  `[v`]
" vnoremap gc ;<C-u>normal gc<Enter>
" onoremap gc ;<C-u>normal gc<Enter>

" カーソル位置の単語をyankする ------------------------------
nnoremap vy vawy

" 矩形選択で自由に移動する ----------------------------------
set virtualedit+=block

"ビジュアルモード時vで行末まで選択 --------------------------
vnoremap v $h

" CTRL-hjklでウィンドウ移動 ---------------------------------
nnoremap <C-j> ;<C-w>j
nnoremap <C-k> ;<C-k>j
nnoremap <C-l> ;<C-l>j
nnoremap <C-h> ;<C-h>j
