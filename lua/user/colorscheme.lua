-- Default options:
local status_ok, kanagawa = pcall(require, "kanagawa")
if not status_ok then
	return
end

-- require("kanagawa").setup({
kanagawa.setup({
	undercurl = true, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = {},
	variablebuiltinStyle = { italic = true },
	specialReturn = true, -- special highlight for the return keyword
	specialException = true, -- special highlight for exception handling keywords
	transparent = false, -- do not set background color
	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	globalStatus = false, -- adjust window separators highlight for laststatus=3
	terminalColors = true, -- define vim.g.terminal_color_{0,17}
	colors = {
		-- look an kanagawa nvim website at bottom for description of whats what
		sumiInk3 = "#2A2A2E", -- Rob you added this to give a nicer cursorline color
		-- sumiInk4 = "#2D4F67", -- lighter indent lines and line numbers
		sumiInk4 = "#41424F", -- lighter indent lines and line numbers
		-- sumiInk4 = "#36314B", -- lighter indent lines and line numbers
	},
	overrides = {},
	-- theme = "default", -- Load "default" theme or the experimental "light" theme
	theme = "dragon",
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
