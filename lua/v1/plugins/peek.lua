return {

	"toppair/peek.nvim",
	-- event = { "VeryLazy" },
	event = { "CursorMoved", "InsertEnter", "CmdlineEnter" },
	build = "deno task --quiet build:fast",
	config = function()
		local peek = require("peek")
		peek.setup({
			app = "browser",
			-- theme = "light",
		})

		vim.api.nvim_create_user_command("PeekOpen", function()
			if not peek.is_open() and vim.bo[vim.api.nvim_get_current_buf()].filetype == "markdown" then
				-- vim.fn.system("i3-msg split horizontal")
				vim.fn.system("i3-msg exec firefox") -- TODO: make it swap windows or open on left side
				-- vim.fn.system("i3-msg no_focus [title='^Peek preview$']") -- can not get this to work. the exec firefox works though
				vim.fn.system("i3-msg focus left") -- can not get this to work. the exec firefox works though
				peek.open()
			end
		end, {})

		vim.api.nvim_create_user_command("PeekClose", function()
			if peek.is_open() then
				peek.close()
				vim.fn.system("i3-msg move left")
			end
		end, {})
	end,
}
