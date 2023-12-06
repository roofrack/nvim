-- NOTE: nvim already has treesitter built into it. This plugin here just makes it easier to install
-- parsers and some options.

return {

	"nvim-treesitter/nvim-treesitter",
	-- event = { "CursorMoved", "InsertEnter", "CmdlineEnter" },
	config = function()
		require("nvim-treesitter.configs").setup({
			--ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
			ensure_installed = {
				"c",
				"help",
				"html",
				"css",
				"javascript",
				"json",
				"svelte",
				"python",
				"bash",
				"dockerfile",
				"vim",
				"vimdoc",
				"query",
				"lua",
				"markdown",
				"sql",
				"typescript",
			},
			auto_install = true,
			sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
			ignore_install = { "" }, -- List of parsers to ignore installing
			autopairs = {
				enable = true,
			},
			highlight = {
				enable = true, -- false will disable the whole extension
				disable = { "" }, -- list of language that will be disabled
				-- additional_vim_regex_highlighting = true,
			},
			indent = { enable = true, disable = { "yaml" } },
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
			build = ":TSUpdate",
		})
	end,
}
