-- If tmux is running use this mapping. If not use that mapping

local opts = { silent = true, noremap = true }
local term = os.getenv("TERM")

if term and string.find(term, "tmux") then
	vim.keymap.set("n", "f<CR>", ":VtrSendFile<CR>", { noremap = true, silent = true })
else
	vim.keymap.set("n", "f<Cr>", ":w<Cr> :! . %<Cr>", opts)
end
