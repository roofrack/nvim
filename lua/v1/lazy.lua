-- Bootstrap lazy.nvim
------------------------------------------------------------
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not vim.loop.fs_stat(lazypath) then
-- 	vim.fn.system({
-- 		"git",
-- 		"clone",
-- 		"--filter=blob:none",
-- 		"https://github.com/folke/lazy.nvim.git",
-- 		"--branch=stable", -- latest stable release
-- 		lazypath,
-- 	})
-- end
-- vim.opt.rtp:prepend(lazypath)
------------------------------------------------------------

-- Newer way from lazy.nvim docs...
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- The setup call at the bottom takes two arguments...
--   1) table of plugins
--   2) table of options for the lazy.nvim plugin itself
------------------------------------------------------------
local plugins = {
	{ import = "v1.plugins" }, -- using import to load multiple modules
	{ import = "v1.plugins.lsp" }, -- lazy won't auto-load a nested directory so need to specify this
}

local opts = {
	-- install = {
	-- 	colorscheme = { "kanagawa" },
	-- },
	ui = {
		-- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
		border = "rounded",
	},
	checker = {
		-- enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
}
-- disable netrw at the very start of your init.lua for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Now call the setup function using plugins & opts as arguments
------------------------------------------------------------
require("lazy").setup(plugins, opts)
