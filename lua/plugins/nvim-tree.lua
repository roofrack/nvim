return {

	{
		"nvim-tree/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, for file icons
		tag = "nightly", -- optional, updated every week. (see issue #1193)
		config = function()
			require("nvim-tree").setup({
				respect_buf_cwd = true, -- Rob you added this so cwd would be persistent
				disable_netrw = true,
				hijack_netrw = true, -- this is already the default
				update_cwd = true,
				diagnostics = {
					enable = true,
					icons = {
						hint = "",
						info = "",
						warning = "",
						error = "",
					},
				},
				git = {
					enable = true,
					ignore = true,
					timeout = 500,
				},
				view = {
					width = 25,
					cursorline = false,
					preserve_window_proportions = true,
					-- mappings = { -- I think there is a newer way to map, check out the wiki
					-- list = {
					-- { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
					-- { key = "h", cb = tree_cb("close_node") },
					-- { key = "v", cb = tree_cb("vsplit") },
					-- },
					-- },
				},
				trash = {
					cmd = "trash",
					require_confirm = true,
				},
				actions = {
					open_file = {
						resize_window = false,
						quit_on_open = true,
						window_picker = {
							enable = false,
						},
					},
				},
			})
		end,
	},
}
