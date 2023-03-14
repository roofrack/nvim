-- I wanted to place all the lsp plugins in this file but it doesnt seem to want to work that
-- way. So they are installed in the plugins/init.lua file. Must have a return statement here or
-- it wont work. Rob, read up more on lua and the return statement.

require("plugins.lsp.configs")
require("plugins.lsp.handlers").setup()
require("plugins.lsp.null-ls")

return {
	--
	--This will not work...
	-- {
	-- "williamboman/mason.nvim", -- newer language-server-installer (MUST INSTALL IN THIS ORDER)
	-- "williamboman/mason-lspconfig.nvim", -- integrates mason with lsp-config
	-- "neovim/nvim-lspconfig", -- default configs for the language servers
	-- -- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
	-- {
	--   "jose-elias-alvarez/null-ls.nvim", -- for formmating & linting n sich ie: eslint_d, prettier
	--   dependencies = { "nvim-lua/plenary.nvim" },
	-- },
	-- config = function()
	-- require("plugins.lsp.configs")
	-- require("plugins.lsp.handlers").setup()
	-- require("plugins.lsp.null-ls")
	-- end,
	-- },
	--
}
