return {

	"folke/which-key.nvim",
	-- event = "VeryLazy",
	event = { "CursorMoved", "InsertEnter", "CmdlineEnter" },
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
	},
}
