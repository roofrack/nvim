return {
	-- If the plugins do not require much configuration can just stick them in here.

	-- commentary
	{
		"numToStr/Comment.nvim",
		event = { "CursorMoved", "InsertEnter", "CmdlineEnter" },
		opts = {},
	},

	-- Indent lines
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.cmd("hi IndentBlanklineChar guifg=#2E2836 gui=nocombine") -- a much nicer color for the lines
			require("ibl").setup({
				indent = {
					char = "▏", --rob you added this to get a finer line for the indent lines
				},
			})
		end,
	},

	-- Needed this config to move messages to bottom of screen for noice.nvim
	{
		"rcarriga/nvim-notify",
		-- enabled = false,
		opts = {
			top_down = false,
		},
	},
}
