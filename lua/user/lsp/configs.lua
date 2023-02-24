-- This file does three things as far as I can tell. First calls the setup
-- functions for the mason and mason-lspconfig plugins. As you can see the
-- mason-lspconfig setup function also provides a list of lsp servers you
-- want installed. Add or delete servers from this list. Then the actual LSP
-- gets set up using the on_attach thingy. Not entirely sure how this works
-- but I am slowly understanding.

local status_ok, mason_installer = pcall(require, "mason")
if not status_ok then
	return
end

-- local servers = { "jsonls", "sumneko_lua", "tsserver", "bashls", "sqlls", "svelte" }
local servers = { "jsonls", "lua_ls", "tsserver", "bashls", "sqlls", "svelte" }

mason_installer.setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = servers,
})

-- Setting up the LSP with on_attach
local lspconfig = require("lspconfig")

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lspconfig[server].setup(opts)
end
