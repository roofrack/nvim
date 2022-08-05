-- [ How to create autocmds in lua ] -----------------------
-- Use an auto group so commands dont get run over and over for the same buffer.
-- Example...
-- local group = vim.api.nvim_create_augroup("HeyBub", { clear = true })
-- vim.api.nvim_create_autocmd("BufEnter", { command = "echo 'Hello from autocmd!'", group = group })

local group = vim.api.nvim_create_augroup("exCommands", { clear = true })
-- Sets the matching bracket to a color I can see easily.
vim.api.nvim_create_autocmd("BufEnter", { command = "hi matchParen guibg=grey", group = group })
-- Sets the vim split line to a nice thin line rather then a column width line.
vim.api.nvim_create_autocmd("BufEnter", { command = "highlight WinSeparator guibg=None", group = group })
