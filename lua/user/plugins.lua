local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Put this before all the plugins
return require('packer').startup(function(use)
------------------------------------------------------------
-- Plugins go Here Robert
------------------------------------------------------------

  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use {
    'nvim-lualine/lualine.nvim', -- Status Line
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'kyazdani42/nvim-tree.lua', -- File Explorer
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
}
  use "rebelot/kanagawa.nvim" -- Colorscheme
  use 'christoomey/vim-tmux-navigator' -- For vim/tmux movement
  use 'christoomey/vim-tmux-runner'

------------------------------------------------------------
-- Plugins go Here Robert
------------------------------------------------------------
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
