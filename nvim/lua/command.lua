-- 指定文字コードで強制的にファイルを開く
vim.api.nvim_create_user_command("Cp932", "edit ++enc=cp932", { force = true })
vim.api.nvim_create_user_command("Eucjp", "edit ++enc=euc-jp", { force = true })
vim.api.nvim_create_user_command("Iso2022jp", "edit ++enc=iso-2022-jp", { force = true })
vim.api.nvim_create_user_command("Utf8", "edit ++enc=utf-8", { force = true })
