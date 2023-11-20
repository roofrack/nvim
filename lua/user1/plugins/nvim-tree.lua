return {

	{
		"nvim-tree/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      -- { "dressing.nvim"},
    },
		tag = "nightly", -- optional, updated every week. (see issue #1193)
		config = function()
			local nvim_tree = require("nvim-tree")
			local nvim_tree_config = require("nvim-tree.config")
			-- Replaces auto_close
			local tree_cb = nvim_tree_config.nvim_tree_callback
			vim.api.nvim_create_autocmd("BufEnter", {
				nested = true,
				callback = function()
					if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
						vim.cmd("quit")
					end
				end,
			})

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- change color for arrows in tree to light blue
    vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
    vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])


			nvim_tree.setup({
				respect_buf_cwd = true, -- Rob you added this so cwd would be persistent
				disable_netrw = true,
				hijack_netrw = true,
				-- open_on_setup = false,
				--[[ ignore_ft_on_setup = {
        "startify",
        "dashboard",
        "alpha",
      }, ]]
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
					-- height = 30,
					hide_root_folder = false,
					side = "left",
					preserve_window_proportions = true,
					mappings = {
						custom_only = false,
						list = {
							{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
							{ key = "h", cb = tree_cb("close_node") },
							{ key = "v", cb = tree_cb("vsplit") },
						},
					},
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
				--  unknown options as of 22.05
				--
				--  update_to_buf_dir = {
				--    enable = true,
				--    auto_open = true,
				--  },
				--  auto_resize = true,
				--  git_hl = 1,
				--  root_folder_modifier = ":t",
			})
		end,
	},
}
