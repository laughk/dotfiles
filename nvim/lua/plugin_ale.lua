-- " for ale
-- " from https://qiita.com/lighttiger2505/items/9a36c5b4035dd469134c

vim.g.ale_linters = {
  terraform = { 'tflint' },
  markdown = { 'textlint' },
  yaml = { 'yamlfmt' }
}

-- " 各ツールをFixerとして登録
vim.g.ale_fixers = {
  python = {
    'autopep8', 'black', 'isort'
  }
}

vim.g.ale_fix_on_save = 1
vim.g.ale_terraform_fmt_executable = "terraform fmt"

-- " 各ツールの実行オプションを変更してPythonパスを固定
vim.g.ale_python_flake8_executable = vim.g.python3_host_prog
vim.g.ale_python_flake8_options = '-m flake8'
vim.g.ale_python_autopep8_executable = vim.g.python3_host_prog
vim.g.ale_python_autopep8_options = '-m autopep8'
vim.g.ale_python_isort_executable = vim.g.python3_host_prog
vim.g.ale_python_isort_options = '-m isort'
vim.g.ale_python_black_executable = vim.g.python3_host_prog
vim.g.ale_python_black_options = '-m black'
