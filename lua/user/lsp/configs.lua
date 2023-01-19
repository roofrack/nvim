-- can probably delete this
------------------------------------------------------------
--nvim-lsp-installer no longer maintained... use mason instead
--[[ local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end ]]
------------------------------------------------------------

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

local lspconfig = require("lspconfig")

local servers = { "jsonls", "sumneko_lua", "tsserver", "bashls", "sqlls", "svelte" }

-- can probably delete this as well
--[[ lsp_installer.setup({
	ensure_installed = servers,
	ui = {
		border = "rounded",
	},
}) ]]

mason_installer.setup({
	ui = {
		border = "rounded",
	},
})

require("mason-lspconfig").setup({
	ensure_installed = servers,
})

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












