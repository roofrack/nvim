return {

	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000, --ensures colorscheme loads first
		config = function()
			require("kanagawa").setup({
				colors = {
					-- add/modify theme and palette colors
					-- look an kanagawa nvim website at bottom for description of whats what
					palette = {
						-- sumiInk3 = "#2A2A2E", -- Rob you added this to give a nicer cursorline color
						-- the above sumiInk3 didnt make the cursorline better so I have an autocommand set inside
						-- the autocommands.lua file to do this
						sumiInk4 = "#1F1F28", -- lighter indent lines and line numbers
					},
				},
			})
			vim.cmd("colorscheme kanagawa") -- this is after the setup function but stil inside the config function
		end,
	},
}
