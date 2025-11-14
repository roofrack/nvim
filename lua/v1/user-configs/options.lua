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
	splitright = false, -- force all vertical splits to go to the right of current window
	swapfile = false,
	signcolumn = "yes", -- Prevents annoying open/close column
	laststatus = 3, -- Makes it so only one global status line shows rather then one per split
	scrolloff = 999, -- keeps cursor in centre of screen when scrolling
	background = "dark",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.winborder = "rounded"
-- NOTE: To set command-line-mode options that are multi words use autocommands. Put them
-- inside your autocommands.lua file. For example this command...

-- the following should work but I think the kanagawa color plugin is overwriting it
-- vim.cmd("highlight WinSeperator guifg=#30666b")

-- :highlight CursorLine guibg=#2A2A2E
-- There is also a way using the nvim api but need to learn more...
-- vim.api.nvim_set_hl(0, "CursorLineNr", { cterm = bold, bold = true })

-- [ White space ] -----------------------------------------
-- Or you can set options the plain old regular way.
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation

-- vim.opt.guicursor =
-- "n-v-c:block,i-ci-ve:ver25-blinkon250,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- vim.opt.guicursor = "i:ver150-blinkon250"
-- need to change it to this but how?
-- set guicursor+=n-v-c:blinkon500-blinkoff500

-- [ Folding ] ---------------------------------------------
-- Or you can set a variable as a shortcut. Less typing.
-- local opt = vim.opt
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()" -- use treesitter to fold

-- this is how you run vimscript in a lua file
-- vim.api.nvim_exec([[ autocmd TermOpen * setlocal nonumber ]], false)
