return {

	"folke/which-key.nvim",
	-- enabled = false,
	event = "VeryLazy",
	init = function()
		-- vim.o.timeout = true
		-- vim.o.timeoutlen = 200
		-- setting this means that you have 200 msec to hit the next key in the mapping
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
