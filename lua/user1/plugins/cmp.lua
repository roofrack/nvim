local kind_icons = {
	Text = "󰉿",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰜢",
	Variable = "󰀫",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "󰑭",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "󰈇",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "󰙅",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

return {

	{
		"hrsh7th/nvim-cmp", -- autocompletion engine
		event = "InsertEnter",
		dependencies = { -- cmp completion extensions
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-path", -- path completions
			"hrsh7th/cmp-cmdline", -- cmdline completions
      "L3MON4D3/LuaSnip", -- snippet engine
			"saadparwaiz1/cmp_luasnip", -- snippet completions
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua", -- adding completion for lua config files
      "onsails/lspkind.nvim", --vs-code like pictograms (this was from the josean video)
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
				mapping = {
					-- Use C-n/p or Tab to cycle through all the cmp completion/lsp suggestions.
					-- I used the following mappings in order to preserve
					-- Ctr j/k for luasnip jumping through the snippet nodes. I tried mapping a multi-use version
					-- but although it works, it is a pain because if in an insert node and cmp has a suggestion then
					-- it wont allow you to continue jumping. It wants you to select a cmp suggestion. So I prefer this
					-- way of mapping. See the luasnip init.lua for the luasnip mappings.
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-l>"] = cmp.mapping.confirm({ select = true }), -- This expands the snippet
					["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
					["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
					-- ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }), -- Robert I dont think you need this
					["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
					["<C-e>"] = cmp.mapping({
						i = cmp.mapping.abort(),
						c = cmp.mapping.close(),
					}),
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						-- Kind icons
						vim_item.kind = string.format("%s ", kind_icons[vim_item.kind])
						-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
						vim_item.menu = ({
							nvim_lsp = "[LSP]",
							nvim_lua = "[NVIM-LUA]",
							luasnip = "[Snippet]",
							buffer = "[Buffer]",
							path = "[Path]",
						})[entry.source.name]
						return vim_item
					end,
				},
				sources = { -- put these in the order you want them to appear in the recommondations window
					{ name = "luasnip" }, -- order this how you want
					{ name = "nvim_lsp" }, -- from lsp-servers
					{ name = "nvim_lua" },
					{ name = "buffer" }, -- text from current buffer
					{ name = "path" },
				},
				confirm_opts = {
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				},
				-- window = {
				-- 	documentation = {
				-- 		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
				-- 	},
				-- },
				-- experimental = {
				--   ghost_text = false,
				--   native_menu = false,
				-- },
			})
		end,
	},
}
