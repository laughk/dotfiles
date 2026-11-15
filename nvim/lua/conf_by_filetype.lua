--
-- from: https://qiita.com/delphinus/items/8160d884d415d7425fcc
--
local M
M = {
  go = function()
    vim.bo.expandtab = false
  end,

  run = function()
    -- 読み込み元ファイル名からファイルタイプを推測する
    local ft = vim.fn.expand'<sfile>:t:r'
    if ft == '' then
      error'cannot detect filetype from <sfile>'
    elseif not M[ft] then
      error('unknown filetype: '..ft..' in ftplugins.lua')
    end
    M[ft]()
  end,
}

M.run()
