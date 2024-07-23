This file contains bits of things for me to remember
------------------------------------------------------------

- Use hyperfine for benchmark testing in the terminal...  
`hyperfine "nvim --headless +qa" --warmup 5k`

- To load a different nvim setup clone it into .config/nvim_setupName
  and set an alias for the command `NVIM_APPNAME=nvim_setupName nvim`

- For plugins I generally lazy load with this. Speeds up loading...
  event = { "CursorMoved", "InsertEnter", "CmdlineEnter" }
  but still experimenting with this. May not be the best way.

Read the Neovim Docs Lua-guide (important... Read it)
  1. explains vim.cmd() ... lua command to run a vimscriopt command
  2. explains vim.fn() ... lua command to run a vimscript function
  3. explains vim.api.nvim_ stuff


- In vim command line...  
   `echo nvim_get_current_buf` ... works  
   `echo vim.api.nvim_get_current_buf`-... does not work (vim.api throws error)

- In a lua file...  
  must include the vim.api part or wont work
  `print(vim.api.nvim_get_current_buf())`
