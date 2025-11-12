-- Some keymaps and UI settings inside an autocmd so only runs when LSP is attached --
-- checkout tj's kickstart.nvim init.lua for his mappings

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, silent = true, desc = "LSP: " .. desc })
		end

		map("gR", "<cmd>Telescope lsp_references<CR>", "Show References")
		map("gD", vim.lsp.buf.declaration, "Go to Declaration")
		map("gd", "<cmd>Telescope lsp_definitions<CR>", "Show Definitions")
		map("gi", "<cmd>Telescope lsp_implementations<CR>", "Show Implementations")
		map("gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show Type Definitions")
		map("<leader>rn", vim.lsp.buf.rename, "Smart Rename")
		map("<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show Buffer Diagnostics")
		map("<leader>d", vim.diagnostic.open_float, "Show Line Diagnostics")
		map("[d", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, "Go to Previous Diagnostic")
		map("]d", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, "Go to Next Diagnostic")
		map("K", vim.lsp.buf.hover, "Show Documentation for whats Under Cursor")
		map("<leader>rs", ":LspRestart<CR>", "Restart LSP")
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP See Availabel Code Actions" })

		-- [ Some settings for the ui ] ----------------------------

		local severity = vim.diagnostic.severity
		vim.diagnostic.config({
			signs = { -- Change the Diagnostic symbols in the sign column (gutter)
				text = {
					[severity.INFO] = " ",
					[severity.WARN] = " ",
					[severity.HINT] = "󰠠 ",
					[severity.INFO] = " ",
				},
			},
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "if_many",
				header = "",
				prefix = "",
			},
			virtual_text = false,
			-- virtual_lines = true,
			update_in_insert = true,
			underline = true,
		})
	end,
})
