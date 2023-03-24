return {

	-- commentary
	{
		"numToStr/Comment.nvim",
		event = { "CursorMoved", "InsertEnter", "CmdlineEnter" },
		config = function()
			require("Comment").setup()
		end,
	},

	-- Indent lines
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "CursorMoved", "InsertEnter", "CmdlineEnter" },
		config = function()
			vim.cmd("hi IndentBlanklineChar guifg=#2E2836 gui=nocombine") -- a much nicer color for the lines
		end,
	},

	--lsp (see plugins/lsp/ for configs)
	{
		"williamboman/mason.nvim", -- newer language-server-installer (MUST INSTALL IN THIS ORDER)
		"williamboman/mason-lspconfig.nvim", -- integrates mason with lsp-config
		"neovim/nvim-lspconfig", -- default configs for the language servers
		-- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
		{
			"jose-elias-alvarez/null-ls.nvim", -- for formmating & linting n sich ie: eslint_d, prettier
			dependencies = { "nvim-lua/plenary.nvim" },
		},
	},
}
