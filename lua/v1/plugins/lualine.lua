-- defining a few tables & functions for lualine ...

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = false,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

local progress = {
	padding = 1,
	"progress",
}

local mode = {
	"mode",
	fmt = function(str)
		--return "-- " .. str .. " --"
		return str
	end,
}

local filetype = {
	"filetype",
	icons_enabled = true,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = function()
	-- return "%l:%-2v %L"
	return "%l/%L col:%-2v"
end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end
--------------------------------------------------------------------------------

return {

	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	--requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	-- event = { "CursorMoved", "InsertEnter", "CmdlineEnter" },
	-- event = { "BufWinEnter" },
	event = "VeryLazy",
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				-- theme = "auto",
				-- theme = "powerline",
				theme = "powerline_dark",
				-- theme = "kanagawa",

				component_separators = { left = "", right = "" },
				--		section_separators = { left = "", right = "" },
				--    section_separators = { left = '', right = '' },
				--    component_separators = { left = '', right = '' },
				disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { branch, diagnostics },
				lualine_c = { "filename" },
				-- lualine_x = { "encoding", "fileformat", "filetype" },
				-- lualine_x = { diff, spaces, "encoding", filetype },
				-- lualine_x = { "fileformat", "hostname", "encoding", filetype },
				lualine_x = {
					"hostname",
					"fileformat",
					"encoding",
					filetype,
				},
				-- lualine_y = { progress },
				-- lualine_y = {},
				-- lualine_y = {percent_thru_file},
				lualine_y = {
					progress,
				},
				-- lualine_z = { location, progress },
				-- lualine_z = { location, lines_count },
				lualine_z = {
					{
						location,
						padding = 0,
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		})
	end,
}
