return {

	{
		"L3MON4D3/LuaSnip", --snippet engine
		-- event = { "InsertEnter" },
		lazy = true,
		dependencies = { "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use
		config = function()
			local ls = require("luasnip")
			local types = require("luasnip.util.types")
			ls.config.set_config({
				history = true, --keep around last snippet local to jump back
				updateevents = "TextChanged,TextChangedI", --update changes as you type
				delete_check_events = "TextChanged", -- will delete snippet from history - just works better with this
				-- enable_autosnippets = true,
				ext_opts = {
					[types.choiceNode] = {
						active = {
							virt_text = { { "●", "orange" } },
							-- virt_text = { { "choiceNode", "Comment" } },
						},
					},
				},
			})

			ls.filetype_extend("typescript", { "javascript" }) -- Rob you added this to add js snippets to typescript

			-- [ Keymaps ] ---------------------------------------------

			-- Jump forwards through snippet nodes
			vim.keymap.set({ "i", "s" }, "<C-j>", function()
				if ls.jumpable(1) then
					ls.jump(1)
				end
			end, { silent = true })

			-- Jump backwards
			vim.keymap.set({ "i", "s" }, "<C-k>", function()
				if ls.jumpable(-1) then
					ls.jump(-1)
				end
			end, { silent = true })

			-- Choice Node mappings while inside a snippet.
			vim.keymap.set("i", "<C-h>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end)

			-- [ Load Snippets ] ---------------------------------------

			-- Custom user created snippets
			require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/v1/snip/luasnippets" })
			-- This loads the snippets from the "friendly-snippets" plugin written in vscode format.
			require("luasnip/loaders/from_vscode").lazy_load()
		end,
	},
}
