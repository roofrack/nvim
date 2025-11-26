-- These config files inside after/lsp/ are here specifically so they run after the nvim-lspconfig plugin loads.
-- That is what the `after` directory is for... this will extend or override the lsp server configuration in nvim-lspconfig.

return {
	-- to get the compatible version of rust-analyzer to use with this version of rust install the lsp using..
	-- rustup component add rust-analyzer (instead of using Mason to install it)
	-- now need to tell vim.lsp.config where to find it so use the cmd below...
	cmd = {
		"rustup",
		"run",
		"stable",
		"rust-analyzer",
	},

	-- settings = {
	-- 	["rust-analyzer"] = { check = {
	--      -- trying rustaceanvim plugin and its not seeing this custom config but this does work for mason-lspconfig enabled configs
	-- 			command = "clippy",
	-- 			extraArgs = {
	-- 				"onType",
	-- 				"onChange",
	-- 				"--workspace", -- Optional: if you want to check the whole workspace
	-- 				"--all-targets", -- Optional: to check all targets
	-- 			},
	-- 	-- 		-- Set the check frequency to "onType" or "onChange" for continuous checking
	-- 	-- 		-- Note: The exact setting name might vary slightly depending on your rust-analyzer version.
	-- 	-- 		-- Common options are 'onType', 'onChange', or similar.
	-- 	-- 		-- You might need to experiment or consult rust-analyzer documentation for the most current option.
	-- 	-- 		overrideCommand = { "cargo", "clippy", "--workspace", "--message-format=json" }, -- Example for direct clippy execution
	-- 	-- 	},
	-- 	-- 	-- Other rust-analyzer settings can go here
	-- 	},
	-- },
	-- -- Other nvim-lspconfig options like on_attach, capabilities, etc.
}
