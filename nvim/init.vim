" プラグイン管理 
" ----------------------------
source ~/.config/nvim/conf.d/plug.vim

" ------------------------------------ + -----------------------------
source ~/.config/nvim/conf.d/basic.vim        "| 基本設定 Basics
source ~/.config/nvim/conf.d/view.vim         "| 表示 view
source ~/.config/nvim/conf.d/indent.vim       "| インデント Indent
source ~/.config/nvim/conf.d/search.vim       "| 検索設定 Search
source ~/.config/nvim/conf.d/move.vim         "| 移動設定 Move
source ~/.config/nvim/conf.d/encoding.vim     "| エンコーディング関連 Encoding
source ~/.config/nvim/conf.d/color.vim        "| カラー関連 Colors
source ~/.config/nvim/conf.d/edit.vim         "| 編集関連 Edit
source ~/.config/nvim/conf.d/golang.vim
source ~/.config/nvim/conf.d/for-plugins.vim  "| Plugin のための設定

" 特定の環境固有の設定をよみこむ
if filereadable(expand('~/.local-conf.vim'))
  source ~/.local-conf.vim
endif
