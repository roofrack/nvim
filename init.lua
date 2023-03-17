-- Use hyperfine for benchmark testing...
-- hyperfine "nvim --headless +qa" --warmup 5k

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
------------------------------------------------------------
-- Settings for the lazy.nvim plugin itself go here in this opts table.

local opts = {
	ui = {
		-- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
		border = "rounded",
	},
}
------------------------------------------------------------

-- Call the lazy.nvim.setup() function (calls all the plugins in ~/.config/nvim/lua/plugins/)
require("lazy").setup("plugins/", opts)

------------------------------------------------------------
-- Some settings may need to be called AFTER the lazy.nvim.setup() call

------------------------------------------------------------
