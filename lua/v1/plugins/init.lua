return {
	-- If the plugins do not require much configuration can just stick them in here.
	-- commentary
	{
		"numToStr/Comment.nvim",
		event = { "CursorMoved", "InsertEnter", "CmdlineEnter" },
		config = function()
			require("Comment").setup()
		end,
	},

	-- Indent lines
	{
		"lukas-reineke/indent-blankline.nvim",
		-- event = { "CursorMoved", "InsertEnter", "CmdlineEnter" },
		config = function()
			-- vim.cmd("hi IndentBlanklineChar guifg=#2E2836 gui=nocombine") -- a much nicer color for the lines
			require("ibl").setup({
				indent = {
					char = "▏", --rob you added this to get a finer line for the indent lines
				},
			})
		end,
	},
}
