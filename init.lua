require("user-configs")

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

-- Lazy.nvim plugin settings go in this opts table
------------------------------------------------------------
local opts = {}

-- Call the lazy.nvim.setup() function (calls all the plugins)
------------------------------------------------------------
require("lazy").setup("plugins/", opts)

-- Some settings need to be called AFTER the lazy.nvim.setup() call
------------------------------------------------------------
