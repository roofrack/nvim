---------------- [ To set up language-servers... ] ---------
-- 1. install the language-server using Mason or npm or pacman
-- 2. Write an LspAttach autocommand (contains mappings n sich)
-- 3. Define capabilities (something to do with enabling auto-completion)
-- 4. Call the lspconfig setup function for that language-server and assign
--    the on_attach & capabilities to it. The server name to use here may
--    be different then the Mason name. Look on the lspconfig website or :h lspconfig

--    To see if a server is attached to current buffer use :LspInfo or :checkhealth lsp
------------------------------------------------------------

return {

	-- "neovim/nvim-lspconfig",
	-- event = { "BufReadPre", "BufNewFile" },
	-- dependencies = {
	-- 	"hrsh7th/cmp-nvim-lsp",
	-- 	-- { "antosha417/nvim-lsp-file-operations", config = true },
	-- },
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		-- Automatically install LSPs and related tools to stdpath for Neovim
		{ "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
		-- { "antosha417/nvim-lsp-file-operations", config = true },

		-- Useful status updates for LSP.
		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		-- { "j-hui/fidget.nvim", event = "VeryLazy", opts = {} }, -- makes nvim slower to load initially?

		-- lazydev Not sure what this is
		{ "lazydev.nvim" }, -- Lua lsp from folke?
	},

	config = function()
		local lspconfig = require("lspconfig") -- import nvim-lspconfig plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp") -- import cmp-nvim-lsp plugin

		-- checkout tj's kickstart.nvim init.lua for his mappings
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("robert-lsp-attach", { clear = true }),
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
				map("[d", vim.diagnostic.goto_prev, "Go to Previous Diagnostic")
				map("]d", vim.diagnostic.goto_next, "Go to Next Diagnostic")
				map("K", vim.lsp.buf.hover, "Show Documentation for whats Under Cursor")
				map("<leader>rs", ":LspRestart<CR>", "Restart LSP")
				vim.keymap.set(
					{ "n", "v" },
					"<leader>ca",
					vim.lsp.buf.code_action,
					{ desc = "LSP See Availabel Code Actions" }
				)
			end,
		})

		-- [ capabilities ] ----------------------------------------
		-- local capabilities = cmp_nvim_lsp.default_capabilities() -- used to enable autocompletion (assigned to every lsp server config)
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		-- capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
		capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())

		-- [ Some settings for the ui ] ----------------------------

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local config = {
			-- disable virtual text
			-- this puts the error & warning messages on the screen
			virtual_text = false,
			-- show signs
			signs = {
				active = signs,
			},
			update_in_insert = true,
			underline = true,
			severity_sort = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		}
		vim.diagnostic.config(config)

		-- [ Setting up each language-server ] ---------------------

		-- configure golang-language-server
		lspconfig["gopls"].setup({
			capabilities = capabilities,
			-- I got these setup options from the gopls repo but do not seem to work
			settings = {
				gopls = {
					-- auto import things
					completeUnimported = true,
					-- auto add function placeholders
					usePlaceholders = true,
				},
			},
		})
		-- configure bash-language-server
		lspconfig["bashls"].setup({
			capabilities = capabilities,
			-- on_attach = on_attach,
		})

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			-- on_attach = on_attach,
		})

		-- configure typescript server with plugin
		-- lspconfig["tsserver"].setup({
		lspconfig["ts_ls"].setup({
			capabilities = capabilities,
			-- on_attach = on_attach,
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			-- on_attach = on_attach,
		})

		-- configure tailwindcss server
		-- lspconfig["tailwindcss"].setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- })

		-- configure svelte server
		lspconfig["svelte"].setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				-- on_attach(client, bufnr)

				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						if client.name == "svelte" then
							client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
						end
					end,
				})
			end,
		})

		-- configure prisma orm server
		lspconfig["prismals"].setup({
			capabilities = capabilities,
			-- on_attach = on_attach,
		})

		-- configure graphql language server
		lspconfig["graphql"].setup({
			capabilities = capabilities,
			-- on_attach = on_attach,
			filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
		})

		-- configure emmet language server
		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			-- on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		-- configure python server
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			-- on_attach = on_attach,
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			-- on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
