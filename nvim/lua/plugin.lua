-- local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
-- if vim.fn.empty(vim.fn.glob(install_path)) == 1 then
--   vim.api.nvim_command("silent !git clone https://github.com/wbthomason/packer.nvim " .. install_path)
-- end

vim.cmd[[packadd packer.nvim]]

return require'packer'.startup(function(use)

  use 'wbthomason/packer.nvim'
  -- use 'mfussenegger/nvim-lint'
  use 'dense-analysis/ale'

  -- Lsp ---------------------------------
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/vim-vsnip"

  -- Text Format -------------------------
  use 'vim-scripts/Align'
  use 'tpope/vim-surround'
  use 'mattn/vim-sqlfmt'
  use 'mattn/vim-goimports'

  -- Color Scheme ------------------------
  use 'arcticicestudio/nord-vim'
  -- Plug 'cocopon/iceberg.vim'
  use 'wadackel/vim-dogrun'

  -- develop tool
  use 'lambdalisue/gina.vim'  -- git client for vim
  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim'
  }
  use 'tpope/vim-fugitive'

  use {
    'Vimjas/vim-python-pep8-indent', ft = {'python', 'python3'}
  }
  use 'thinca/vim-quickrun'
  use 'tyru/open-browser-github.vim'
  use 'scrooloose/nerdcommenter'
  use 'airblade/vim-gitgutter'

  -- Normal Utility ----------------------
  -- use 'cocopon/vaffle.vim'    -- filer for vim
  use { -- filer for vim
    'tamago324/lir.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons'
    }
  }
  use 'itchyny/lightline.vim'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  if not vim.fn.has('win32') and not vim.fn.has('win64') then
    use {
      'ibhagwan/fzf-lua',
      -- optional for icon support
      requires = { 'kyazdani42/nvim-web-devicons' }
    }
  end
  use 'thinca/vim-qfreplace'
  use 'tyru/open-browser.vim'

  -- edit Utility -------------------------
  use 'chrisbra/Colorizer'
  use 'kannokanno/previm'
  use 'nathanaelkane/vim-indent-guides'

  -- Syntax -------------------------------
  use 'aklt/plantuml-syntax'
  use 'ap/vim-css-color'
  use 'hashivim/vim-terraform'
  use 'hdima/python-syntax'
  use 'leafgarland/typescript-vim'
  use 'mechatroner/rainbow_csv'
  use 'pearofducks/ansible-vim'
  use 'posva/vim-vue'
  use 'ryanoasis/vim-devicons'
  use 'vim-scripts/gitignore.vim'
  use {
    'nastevens/vim-cargo-make',
    requires = { 'cespare/vim-toml' }
  }
  use 'nastevens/vim-duckscript'

end)
