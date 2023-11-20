-- Bootstrap lazy.nvim
------------------------------------------------------------
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

-- The setup call at the bottom takes two arguments...
------------------------------------------------------------
-- 1) table of plugins
-- 2) table of options for the lazy.nvim plugin itself

local plugins = {
	{ import = "user1.plugins" }, -- using import to load multiple modules
	{ import = "user1.plugins.lsp" }, -- lazy won't auto-load a nested directory so need to specify this
}

local opts = {
	install = {
		colorscheme = { "kanagawa" },
	},
	ui = {
		-- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
		border = "rounded",
	},
	checker = {
		enabled = true,
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
