-- This is for an improved ui experience with telescope, nvim-tree, etc
-- Uses the vim.ui.select & vim.ui.input functions

return {
	"stevearc/dressing.nvim",
	-- event = "VeryLazy",
	event = { "CursorMoved", "InsertEnter", "CmdlineEnter" },
}
