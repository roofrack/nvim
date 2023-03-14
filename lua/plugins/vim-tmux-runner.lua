-- vim-tumux-runner options...

-- Hey rob this is not a plugin written in lua. You dont call setup(). For these two options to work here
-- I had to add them at the beginning of the file. Can't add them at the end or inside a config function
-- because that doesnt seem to work. They could also be added in the root init.lua file instead.

-- Allow use of Vtr mappings using your <leader> key
vim.g["VtrUseVtrMaps"] = 1 -- map this in root init.lua after setup() call or wont work

-- Allows you to send a lua file to the runner
-- vim.api.nvim_exec([[ let g:vtr_filetype_runner_overrides = {'lua': 'lua {file}'} ]], false)
-- Or can use vim.cmd like this...
vim.cmd("let g:vtr_filetype_runner_overrides = {'lua': 'lua {file}', 'typescript': 'deno run {file}'}")

return {

	{
		"christoomey/vim-tmux-navigator", -- For vim/tmux movement
		event = "VeryLazy",
	},
	{
		"christoomey/vim-tmux-runner",
		event = "VeryLazy",
	},
}
