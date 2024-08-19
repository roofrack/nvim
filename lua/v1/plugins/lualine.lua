return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "VeryLazy",
	opts = {
		options = {
			icons_enabled = true,
			theme = "powerline_dark", -- other themes check lualine.nvim
			component_separators = { left = "", right = "" },
			disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
			always_divide_middle = true,
		},
		sections = {
			-- Note: brackets have to surround section components of course Robert
			-- and add the component options underneath component name.
			-- <--a,b,c on left side and x,y,z--> on right side

			lualine_a = {
				{ "mode", icon = "󰕷" },
			},
			------------------------------------------------------
			lualine_b = {
				{
					"branch",
					icons_enabled = true,
					icon = "",
				},
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					sections = { "error", "warn" },
					symbols = { error = " ", warn = " " },
					colored = false,
					update_in_insert = false,
					always_visible = false,
				},
			},
			------------------------------------------------------
			lualine_c = {
				{
					"filename",
					color = { fg = "#2afa62", gui = "italic,bold" },
					-- color = { fg = "#2afa62", gui = "italic" },
					icon = { "󰈙", color = { fg = #"bc66d9", gui = "italic" } },
				},
			},
			------------------------------------------------------
			lualine_x = {
				{
					-- "Component to show how many lazy.nvim updates"
					require("lazy.status").updates,
					cond = require("lazy.status").has_updates,
					color = { fg = "#ff9e64", gui = "italic" },
				},
				{
					"hostname",
					color = { gui = "italic" },
					icon = { "", color = { fg = "#b6b6fc", gui = "italic" } },
				},
				{ "fileformat", color = { fg = "#f6fa0f", gui = "italic" } },
				{ "encoding", color = { gui = "italic" } },
				{ "filetype", color = { gui = "italic" }, icon_only = true },
			},
			------------------------------------------------------
			lualine_y = {
				{
					"progress",
					padding = 1, -- adds more room to expand so looks better
				},
			},
			------------------------------------------------------
			lualine_z = {
				{
					"location",
					-- Rob you made this custom function for the location. Needed to use fmt
					-- here in order to use a function. Think that is a lualine thing?
					fmt = function()
						return " %l/%L  %-2v"
					end,
					left_padding = 0,
				},
			},
		},
		inactive_sections = { -- for splits but I have one status line set
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = { -- I dont know what this does???
		},
	},
}
