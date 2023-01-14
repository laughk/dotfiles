--
-- 基本的な設定
--

-- キーマップリーダー Leader はここで , にバインドされる。
vim.g.mapleader = ","  

-- 文字コード関連
--- デフォルトエンコーディング
vim.o.encoding = "utf-8"
vim.o.termencoding = "utf-8"
vim.o.fileformats = "unix,dos,mac"

-- ワイルドカードで表示するときの優先度を低くする拡張子
vim.o.suffixes=".bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc"

vim.o.scrolloff = 5                      -- スクロール時の余白確保
vim.o.textwidth = 0                      -- 一行に長い文章を書いていても自動折り返しをしない
vim.o.backup = false                     -- バックアップ取らない
vim.o.autoread = true                    -- 他で書き換えられたら自動で読み直す
vim.o.autochdir = true                   -- カレントバッファのファイルがあるディレクトリに自動で移動する
vim.o.swapfile = false                   -- スワップファイル作らない
vim.o.hidden = true                      -- 編集中でも他のファイルを開けるようにする
vim.o.backspace = "indent,eol,start"     -- バックスペースでなんでも消せるように
vim.o.formatoptions = "lmoq"             -- テキスト整形オプション，マルチバイト系を追加
vim.o.showcmd = true                     -- コマンドをステータス行に表示
vim.o.showmode = ture                    -- 現在のモードを表示
vim.o.formatoptions = "q"                -- 自動で形成(改行とか)しない, qgで手動でなら可能
vim.o.undodir = "~/.vimundo"             -- undofile のパスを指定
vim.o.laststatus = 2                     -- 常にステータスラインを表示
vim.o.ruler = true                       -- カーソルが何行目の何列目に置かれているかを表示する
vim.o.wildmenu = true                    -- コマンド補完を強化
vim.o.wildmode = "list:full"             -- リスト表示，最長マッチ
vim.o.history = 1000                     -- コマンド・検索パターンの履歴数
vim.o.complete = vim.o.complete .. ",k"  -- 補完に辞書ファイル追加
vim.o.smartindent = true                 -- 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
vim.o.cindent = true                     -- Cプログラムファイルの自動インデントを始める


vim.o.browsedir= "buffer"              -- Exploreの初期ディレクトリ
vim.o.whichwrap='b,s,h,l,<,>,[,]'      -- カーソルを行頭、行末で止まらないようにする
-- vim.cmd[[vim.o.viminfo='50,<1000,s100,\"50]]  -- viminfoファイルの設定

-- beep sound
vim.o.errorbells = false
vim.o.visualbell = false


--
-- 編集関連の設定
-- ----------------------------------------------

-- 矩形選択で自由に移動する
vim.o.virtualedit = vim.o.virtualedit .. "block"


-- softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
vim.o.tabstop = 4
vim.o.shiftwidth = 2
vim.o.softtabstop = 0

-- 基本的には soft tab を使う
vim.o.expandtab = true

-- insertモードを抜けるとIMEオフ
vim.o.imdisable = false
vim.o.iminsert = 0
vim.o.imsearch = 0
vim.o.imcmdline = false
vim.cmd[[inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>]]

-- ファイル内検索関連
vim.o.wrapscan = true   -- 最後まで検索したら先頭へ戻る
vim.o.ignorecase = true -- 大文字小文字無視
vim.o.smartcase = true  -- 検索文字列に大文字が含まれている場合は区別して検索する
vim.o.incsearch = true  -- インクリメンタルサーチ
vim.o.hlsearch = true   -- 検索文字をハイライト


---- clipboard
-- + reg: Ctrl-v nnamedplus
-- * reg: middle click unnamed
if vim.fn.has("clipboard") == 1 then
  vim.o.clipboard = "unnamedplus,unnamed"
end

vim.cmd[[

"Escの2回押しでハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>

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

]]

-- ビジュアルモード時vで行末まで選択
vim.api.nvim_set_keymap('v', 'v', '$h', { noremap = true, silent = true })

--
-- 便利系
-- -------------------------------------------------------

-- 保存時に行末の空白を除去する
-- Todo: lua で書く
vim.cmd[[
if ! &filetype=='markdown'
  autocmd BufWritePre * :%s/\s\+$//ge
endif
]]

-- XMLの閉タグを自動挿入
vim.cmd[[
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
augroup END
]]


-- □とか○の文字があってもカーソル位置がずれないようにする
if vim.fn.exists('&ambiwidth') then
   vim.o.ambiwidth = "double"
end


--
-- その他
-- --------------------------------------------------

-- Windows の場合 PowerShell 環境でも shell は cmd を使う
-- （一部プラグインが動こないことがあるため）
-- if vim.fn.has('win32') or vim.fn.has('win64') then
--   vim.o.shell=cmd
-- end

