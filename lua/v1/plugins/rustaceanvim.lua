-- Trying out this plugin for rust lsp stuff, not sure what all it does
-- NOTE: I have the lsp set up disabled in mason-lspconfig for now as it
--       duplicates lsp setups with this plugin.
return {
	"mrcjkb/rustaceanvim",
	-- enabled = false,
	version = "^6", -- Recommended
	lazy = false, -- This plugin is already lazy
}
