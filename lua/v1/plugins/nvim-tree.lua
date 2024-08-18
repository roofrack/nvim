-- Details on custom mapping are from the nvim-tree github page. To get specific mappings scroll down in the docs.
-- I'm not sure where the function below should actually go for lazy.nvim setup. This works so will leave it but
-- maybe it belongs in a config function inside the return. I like this way. Seems cleaner.
local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")
	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end
	-- default mappings
	api.config.mappings.default_on_attach(bufnr)
	-- custom mappings
	vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
end
------------------------------------------------------------------------------------------

return {
	"nvim-tree/nvim-tree.lua",
	cmd = "NvimTreeToggle", -- lazy load on command
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		-- init function runs before plugin loads which is important here or keymap won't be seen
		-- as it lazyloads using this keymap so like I said, the keymap needs to load first
		vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "nvimTreeToggle", silent = true })
		-- change color for arrows in tree to light blue (I don't think this does anything)
		vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
		vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])
	end,
	opts = {
		on_attach = my_on_attach,
		respect_buf_cwd = true, -- Rob you added this so cwd would be persistent
		disable_netrw = true,
		hijack_netrw = true,
		open_on_tab = true,
		hijack_cursor = false,
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
		update_focused_file = {
			enable = true,
			update_cwd = true,
			ignore_list = {},
		},
		system_open = {
			cmd = nil,
			args = {},
		},
		filters = {
			dotfiles = false,
			custom = {},
		},
		git = {
			enable = true,
			ignore = true,
			timeout = 500,
		},
		view = {
			width = 25,
			side = "left",
			preserve_window_proportions = true,
			number = false,
			relativenumber = false,
		},
		renderer = {
			indent_markers = {
				enable = true,
			},
			icons = {
				glyphs = {
					folder = {
						arrow_closed = "", -- arrow when folder is closed
						arrow_open = "", -- arrow when folder is open
					},
				},
			},
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
	},
}
