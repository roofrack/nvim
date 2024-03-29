-- [ General settings ] -------------------------------------
-- Lets use a little Lua here to set the options.

local options = {
	wrap = false, -- display lines as one long line
	fileencoding = "utf-8", -- the encoding written to a file
	mouse = "a", -- allow the mouse to be used in neovim
	number = true, -- set numbered lines
	cursorline = true, -- set numbered lines
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	termguicolors = true,
	splitbelow = true, -- force all horizontal splits to go below current window
	-- splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false,
	signcolumn = "yes", -- Prevents annoying open/close column
	laststatus = 3, -- Makes it so only one global status line shows rather then one per split
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- [ White space ] -----------------------------------------
-- Or you can set options the plain old regular way.
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.guicursor = "i:ver100-blinkon250"

-- [ Folding ] ---------------------------------------------
-- Or you can set a variable as a shortcut. Less typing.
-- local opt = vim.opt
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()" -- use treesitter to fold

-- [ Command line options ] --------------------------------

-- NOTE: To set command-line-mode options use vim.cmd("command here")
-- for example vim.cmd("highlight WinSeparator guifg=#30666b")
-- BUT some commands will get overwritten like this one. It gets overwritten when the
-- kanagawa plugin gets returned. So stick the command in there (which I did).

-- this is how you run vimscript in a lua file
-- Rob look into the difference between nvim_exec() and vim.cmd()
-- vim.api.nvim_exec([[ autocmd TermOpen * setlocal nonumber ]], false)
