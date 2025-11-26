-- Need to update nvim.lsp capabilities to use cmp lsp completion capabilities. --
-- Josean Martinez youtube video.

return {
	"hrsh7th/cmp-nvim-lsp",
	-- enabled = false,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "antosha417/nvim-lsp-file-operations", config = true },
		-- { "folke/lazydev.nvim", opts = {} }, -- this plugin fixes the global vim error
		-- trying this without the above plugin to see if get any vim global errors
	},
	config = function()
		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- used to enable autocompletion (assign to every lsp server config)
		-- local capabilities = require("blink.cmp").get_lsp_capabilities()
		local capabilities = cmp_nvim_lsp.default_capabilities()
		vim.lsp.config("*", {
			capabilities = capabilities,
		})
	end,
}

-- For trying blink.cmp but havnt got this to work yet if'n you
-- want to try blink.cmp
-- local function get_capabilities()
--     -- Check if blink.cmp is available
--     local has_blink, blink = pcall(require, "blink.cmp")
--
--     if has_blink and blink.get_lsp_capabilities then
--         -- Merge default capabilities with blink.cmp capabilities
--         return vim.tbl_deep_extend(
--             "force",
--             vim.lsp.protocol.make_client_capabilities(),
--             blink.get_lsp_capabilities(),
--             {
--                 -- Additional capabilities can be added here
--                 workspace = {
--                     fileOperations = {
--                         didRename = true,
--                         willRename = true,
--                     },
--                 },
--             }
--         )
--     else
--         -- Fallback to default capabilities if blink.cmp is not available
--         return vim.lsp.protocol.make_client_capabilities()
--     end
-- end
