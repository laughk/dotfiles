--
-- 表示に関する設定
--

vim.o.showmatch = true                                  -- 括弧の対応をハイライト
vim.o.number = true                                     -- 行番号表示
vim.o.list = true                                       -- 不可視文字表示
vim.o.listchars = 'tab:>_,trail:_,extends:>,precedes:<' -- 不可視文字の表示形式
vim.o.display = 'uhex'                                  -- 印字不可能文字を16進数で表示
vim.o.cursorline = true                                 -- カーソル行をハイライト
vim.o.lazyredraw = true                                 -- コマンド実行中は再描画しない

-- 全角スペースの表示
vim.cmd[[
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/
]]

-- カレントウィンドウにのみ罫線を引く
vim.cmd[[
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black
]]

