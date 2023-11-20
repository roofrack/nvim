-- [ vim-tmux-nav & vim-tmux-runner ] ----------------------

-- These two plugins are not written in lua. You dont call the config spec or setup().
-- I used the lazy.nvim Spec "cond" here so the plugins will only load if tmux is started.
-- For the Vtr plugin I also added an additional test so if true then a key map is set as well as a few options.

return {
	{
		"christoomey/vim-tmux-navigator", --for vim/tmux movement
		event = "VeryLazy",
		cond = function() --this will allow the vim-tmux-navigator plugin to load only when a tmux session is running
			local term = os.getenv("TERM")
			return term and string.find(term, "tmux")
		end,
	},
	{
		"christoomey/vim-tmux-runner",
		cond = function()
			local term = os.getenv("TERM")
			if term and string.find(term, "tmux") then
				vim.keymap.set("n", "f<CR>", ":VtrSendFile<CR>", { noremap = true, silent = true })
				-- this will remap f<CR> to run Vtr send file to runner. Otherwise it is mapped to run current file in vim window
				vim.g["VtrUseVtrMaps"] = 1
				-- Allow use of Vtr mappings using your <leader> key
				--Allows you to send a lua file to the runner. Add other file types as needed
				-- vim.api.nvim_exec([[ let g:vtr_filetype_runner_overrides = {'lua': 'lua {file}'} ]], false)
				-- Or can use vim.cmd like this...
				vim.cmd("let g:vtr_filetype_runner_overrides = {'lua': 'lua {file}', 'typescript': 'deno run {file}'}")
			end
			return term and string.find(term, "tmux")
		end,
	},
}
