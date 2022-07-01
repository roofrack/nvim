-- [[ How to create autocmds in lua ]]--

-- Use an auto group so commands dont get run over and over for the
-- same buffer.

-- Example...
-- local group = vim.api.nvim_create_augroup("HeyBub", { clear = true })
-- vim.api.nvim_create_autocmd("BufEnter", { command = "echo 'Hello from autocmd!'", group = group })
