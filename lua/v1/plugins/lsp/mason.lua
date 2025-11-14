-- 1. mason.nvim is a package manager for langyage-servers, linters, formatters, etc
-- 2. nvim-lspconfig is a plugin for quick configs for language-servers.
-- 3. mason-lspconfig.nvim bridges mason.nvim with nvim-lspconfig (or just called lspconfig)
-- 4. Must install mason-lspconfig.nvim first. Then as dependencies install mason.nvim and
--    then nvim-lspconfig plugins in that order.
-- 5. mason-lspconfig will automatically call vim.lsp.enable() for each server.

-- Notes:
-- Rob, for shell scripts use Mason to install both shellcheck and shfmt. Remember this...
-- the bashls lsp server uses shellcheck behind the scenes. And formmating uses shfmt
-- as per your formatting.lua plugin file.

return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			-- List of lsp servers for mason to install but MUST use the nvim-lspconfig name and
			-- NOT the Mason server name here!
			ensure_installed = {
				"ts_ls",
				"gopls",
				"html",
				"bashls",
				"vimls",
				-- "cssls",
				-- "tailwindcss",
				-- "svelte",
				"lua_ls",
				-- "graphql",
				-- "emmet_ls",
				-- "prismals",
				-- "pyright",
				-- "eslint",
			},
		},
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				},
			},
			"neovim/nvim-lspconfig",
			-- dependencies = { "saghen/blink.cmp" },
			-- Trying to get blink.cmp capabilities to work but this didnt work
			-- Havent got this to work yet
			--
			-- local capabilities = require("blink.cmp").get_lsp_capabilities()
			-- config = function()
			-- vim.lsp.config("*", {
			-- capabilities = capabilities,
			-- require("lspconfig").setup({ capabilities = capabilities }),
			-- })
			-- end,
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				-- "prettier", -- prettier formatter
				-- "stylua", -- lua formatter
				-- "isort", -- python formatter
				-- "black", -- python formatter
				-- "pylint",
				-- "eslint_d",
			},
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
}
