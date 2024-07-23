local opts = { silent = true, noremap = true }

local term = os.getenv("TERM")

if term and string.find(term, "tmux") then
	vim.keymap.set("n", "f<CR>", ":VtrSendFile<CR>", { noremap = true, silent = true })
else
	vim.keymap.set("n", "f<cr>", ":w<cr>:!node %<cr>", opts)
end
