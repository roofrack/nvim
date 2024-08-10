return {

	"windwp/nvim-autopairs",
	event = "InsertEnter", -- this works great for lazy loading

	config = function()
		local autopairs = require("nvim-autopairs")

		autopairs.setup({
			check_ts = true,
			ts_config = {
				lua = { "string", "source" },
				javascript = { "string", "template_string" },
				java = false,
			},
			disable_filetype = { "TelescopePrompt", "spectre_panel" },
			fast_wrap = {
				map = "<C-s>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
				offset = 0, -- Offset from pattern match
				end_key = "$",
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				check_comma = true,
				highlight = "PmenuSel",
				highlight_grey = "LineNr",
			},
		})
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

		-- rob added this... while in insert mode, jump out of brackets
		-- but won't work for double quotes " by themselves outside any parenthesis
		-- (can also just type the closing bracket and the cursor will jump outside it)
		vim.keymap.set("i", "<C-l>", "<Esc>%%a<space>", { silent = true, desc = "autopairs jump out of bracket" })
	end,
}
