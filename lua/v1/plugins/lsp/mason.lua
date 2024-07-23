-- 1. mason.nvim is a package manager for langyage-servers, linters, formatters, etc
-- 2. mason-lspconfig.nvim bridges mason.nvim with nvim-lspconfig (or just called lspconfig)
-- 3. After calling the two setup functions below can now set up language-servers using nvim-lspconfig
--    in the lspconfig file

return {

	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- this tells Mason to install linters/formmatters
	},

	config = function()
		local mason = require("mason") -- import mason
		local mason_lspconfig = require("mason-lspconfig") -- import mason-lspconfig
		local mason_tool_installer = require("mason-tool-installer") -- for auto installing linters & formatters

		mason.setup({ -- must call this set up before mason-lspconfig
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				-- list of language-servers for mason to install
				"tsserver",
				"lua_ls",
				"bashls",
				"denols",
			},
			-- auto-install configured servers (with lspconfig)
			-- automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({ -- mason to auto install linters and formatters listed here
			"shellcheck",
			"shfmt",
		})
	end,
}
