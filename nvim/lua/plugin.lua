local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy_config = {
  install = { colorscheme = { "habamax" } },
}

local plugins = {

  -- { 'mfussenegger/nvim-lint' },
  { 'dense-analysis/ale',
    config = function()
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
    end,
  },

  -- Lsp ---------------------------------
  -- {
    -- 'neoclide/coc.nvim',
    -- branch = 'release',
    -- config = function()
      -- require("plugin_coc-nvim")
    -- end
  -- },
  --
  { 'neovim/nvim-lspconfig',
    cmd = { "LspInfo", "LspLog" },
    event = { "BufRead" },
  },
  { 'williamboman/mason.nvim',
    cmd = { "Mason", "MasonInstall" },
    event = { "WinNew", "WinLeave", "BufRead" },
    build = ':MasonUpdate',
  },
  { 'williamboman/mason-lspconfig.nvim' },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/vim-vsnip" },

  -- Text Format -------------------------
  { 'vim-scripts/Align',
    config = function()
      -- Alignを日本語環境で使用するための設定
      vim.g.Align_xstrlen = 3
    end,
  },
  { 'tpope/vim-surround' },
  { 'mattn/vim-sqlfmt' },
  { 'mattn/vim-goimports' },

  -- Color Scheme ------------------------
  { 'shaunsingh/nord.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- Example config in lua
      vim.g.nord_contrast = true
      vim.g.nord_borders = true
      vim.g.nord_disable_background = true
      vim.g.nord_italic = false
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = false

      -- Load the colorscheme
      require('nord').set()

      -- colorscheme 設定は最後に記載しないとコメントや文字列が斜体になってしまう
      -- ref. https://github.com/shaunsingh/nord.nvim/issues/138
      vim.cmd[[colorscheme nord]]
    end,
  },
  -- Plug 'cocopon/iceberg.vim'
  { 'wadackel/vim-dogrun' },

  -- develop tool
  { 'lambdalisue/gina.vim',  -- git client for vim
    config = function()
      vim.cmd[[
      nnoremap Gs :Gina status<CR>

      call gina#custom#command#option(
            \ 'commit', '-v|--verbose'
            \)

      call gina#custom#mapping#nmap(
            \ 'status', '<C-^>',
            \ ':<C-u>Gina commit<CR>',
            \ {'noremap': 1, 'silent': 1}
            \)
      ]]
    end,
  },
  {
    'NeogitOrg/neogit',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      local neogit = require('neogit')
      neogit.setup {}
    end,
  },
  { 'tpope/vim-fugitive' },

  {
    'Vimjas/vim-python-pep8-indent', ft = {'python', 'python3'}
  },
  { 'thinca/vim-quickrun' },
  { 'tyru/open-browser-github.vim',
    dependencies = 'tyru/open-browser.vim',
  },
  { 'scrooloose/nerdcommenter',
    config = function()
      --  コメントの間にスペースを空ける
      vim.cmd[[let NERDSpaceDelims = 1]]

      -- <Leader>xでコメントをトグル(NERD_commenter.vim)
      -- vim.cmd[[" map <Leader>x, c<space>]]

      -- 未対応ファイルタイプのエラーメッセージを表示しない
      vim.cmd[[let NERDShutUp=1]]
    end
  },
  { 'airblade/vim-gitgutter' },

  -- Normal Utility ----------------------
  { -- filer for vim
    'tamago324/lir.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons'
    },
    config = function()
      require("plugin_lir-nvim")
    end
  },
  { 'itchyny/lightline.vim',
    config = function()
      require("plugin_lightline")
    end
  },
  { 'thinca/vim-qfreplace' },
  { 'tyru/open-browser.vim' },
  { 'segeljakt/vim-silicon', -- Vim plugin for generating images of source code using https://github.com/Aloxaf/silicon
    config = function()
      vim.cmd[[
      let g:silicon = {
            \   'theme':                 'Nord',
            \   'font':                  'Hack',
            \   'background':         '#FFFFFF',
            \   'shadow-color':       '#555555',
            \   'line-pad':                   2,
            \   'pad-horiz':                  0,
            \   'pad-vert':                   0,
            \   'shadow-blur-radius':         0,
            \   'shadow-offset-x':            0,
            \   'shadow-offset-y':            0,
            \   'line-number':           v:false,
            \   'round-corner':          v:true,
            \   'window-controls':       v:true,
            \ }
      ]]
    end,
  },

  -- edit Utility -------------------------
  { 'chrisbra/Colorizer' },
  { 'kannokanno/previm' },
  { 'nathanaelkane/vim-indent-guides' },
  {
    'nvimtools/none-ls.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        source = {
          require("nu-ls"),
          null_ls.builtins.diagnostics.credo,
          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.completion.spell,
        },
      })
    end,
  },
  { 'github/copilot.vim' },


  -- Syntax -------------------------------
  { 'aklt/plantuml-syntax' },
  { 'ap/vim-css-color' },
  { 'hashivim/vim-terraform',
    config = function()
      vim.g.terraform_fmt_on_save=1
    end,
  },
  { 'hdima/python-syntax' },
  { 'leafgarland/typescript-vim' },
  { 'mechatroner/rainbow_csv' },
  { 'pearofducks/ansible-vim' },
  { 'posva/vim-vue' },
  -- { 'ryanoasis/vim-devicons',
    -- config = function()
      -- -- フォルダアイコンの表示をON
      -- vim.cmd[[let g:WebDevIconsUnicodeDecorateFolderNodes = 1]]
    -- end,
  -- },
  { 'vim-scripts/gitignore.vim' },
  {
    'nastevens/vim-cargo-make',
    dependencies = { 'cespare/vim-toml' }
  },
  { 'nastevens/vim-duckscript' },
  {
    'nvim-treesitter/nvim-treesitter',
    cmd = 'TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all"
        ensure_installed = {
          'lua',
          'hcl',
          'go',
          'python',
          'markdown',
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        highlight = {
          enable = true,
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          -- additional_vim_regex_highlighting = false,
        },
      }
    end,
  },
  {
    'LhKipp/nvim-nu',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    -- cmd = 'TSInstall nu',
    config = function()
      require'nu'.setup{}
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', 'ff', builtin.find_files, {})
      vim.keymap.set('n', 'fg', builtin.live_grep, {})
      vim.keymap.set('n', 'fb', builtin.buffers, {})
      vim.keymap.set('n', 'fh', builtin.help_tags, {})
    end,
  },
  {
    'zioroboco/nu-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'google/vim-jsonnet',
  }
}

require("lazy").setup(plugins, lazy_config)
