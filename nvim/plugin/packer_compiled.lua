-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "C:\\Users\\laughk\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\laughk\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\laughk\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\laughk\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\laughk\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  Align = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\Align",
    url = "https://github.com/vim-scripts/Align"
  },
  Colorizer = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\Colorizer",
    url = "https://github.com/chrisbra/Colorizer"
  },
  ale = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\ale",
    url = "https://github.com/dense-analysis/ale"
  },
  ["ansible-vim"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\ansible-vim",
    url = "https://github.com/pearofducks/ansible-vim"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  fzf = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["gina.vim"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gina.vim",
    url = "https://github.com/lambdalisue/gina.vim"
  },
  ["gitignore.vim"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gitignore.vim",
    url = "https://github.com/vim-scripts/gitignore.vim"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lightline.vim",
    url = "https://github.com/itchyny/lightline.vim"
  },
  ["lir.nvim"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lir.nvim",
    url = "https://github.com/tamago324/lir.nvim"
  },
  neogit = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  nerdcommenter = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nerdcommenter",
    url = "https://github.com/scrooloose/nerdcommenter"
  },
  ["nord-vim"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nord-vim",
    url = "https://github.com/arcticicestudio/nord-vim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-nu"] = {
    commands = { "TSInstall nu" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-nu",
    url = "https://github.com/LhKipp/nvim-nu"
  },
  ["nvim-treesitter"] = {
    commands = { "TSUpdate" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["open-browser-github.vim"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\open-browser-github.vim",
    url = "https://github.com/tyru/open-browser-github.vim"
  },
  ["open-browser.vim"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\open-browser.vim",
    url = "https://github.com/tyru/open-browser.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plantuml-syntax"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plantuml-syntax",
    url = "https://github.com/aklt/plantuml-syntax"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  previm = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\previm",
    url = "https://github.com/kannokanno/previm"
  },
  ["python-syntax"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\python-syntax",
    url = "https://github.com/hdima/python-syntax"
  },
  rainbow_csv = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\rainbow_csv",
    url = "https://github.com/mechatroner/rainbow_csv"
  },
  ["typescript-vim"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\typescript-vim",
    url = "https://github.com/leafgarland/typescript-vim"
  },
  ["vim-cargo-make"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-cargo-make",
    url = "https://github.com/nastevens/vim-cargo-make"
  },
  ["vim-css-color"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-css-color",
    url = "https://github.com/ap/vim-css-color"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-dogrun"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-dogrun",
    url = "https://github.com/wadackel/vim-dogrun"
  },
  ["vim-duckscript"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-duckscript",
    url = "https://github.com/nastevens/vim-duckscript"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-goimports"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-goimports",
    url = "https://github.com/mattn/vim-goimports"
  },
  ["vim-indent-guides"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-indent-guides",
    url = "https://github.com/nathanaelkane/vim-indent-guides"
  },
  ["vim-python-pep8-indent"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-python-pep8-indent",
    url = "https://github.com/Vimjas/vim-python-pep8-indent"
  },
  ["vim-qfreplace"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-qfreplace",
    url = "https://github.com/thinca/vim-qfreplace"
  },
  ["vim-quickrun"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-quickrun",
    url = "https://github.com/thinca/vim-quickrun"
  },
  ["vim-silicon"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-silicon",
    url = "https://github.com/segeljakt/vim-silicon"
  },
  ["vim-sqlfmt"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-sqlfmt",
    url = "https://github.com/mattn/vim-sqlfmt"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-terraform"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-terraform",
    url = "https://github.com/hashivim/vim-terraform"
  },
  ["vim-toml"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-toml",
    url = "https://github.com/cespare/vim-toml"
  },
  ["vim-vue"] = {
    loaded = true,
    path = "C:\\Users\\laughk\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-vue",
    url = "https://github.com/posva/vim-vue"
  }
}

time([[Defining packer_plugins]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'TSUpdate', function(cmdargs)
          require('packer.load')({'nvim-treesitter'}, { cmd = 'TSUpdate', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-treesitter'}, { cmd = 'TSUpdate' }, _G.packer_plugins)
          return vim.fn.getcompletion('TSUpdate ', 'cmdline')
      end})
pcall(vim.cmd, [[au CmdUndefined TSInstall nu ++once lua require"packer.load"({'nvim-nu'}, {}, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType python ++once lua require("packer.load")({'vim-python-pep8-indent'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType python3 ++once lua require("packer.load")({'vim-python-pep8-indent'}, { ft = "python3" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
