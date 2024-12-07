-- Set leader key
vim.g.mapleader = ","

local map = function(modes, lhs, rhs, desc)
	vim.keymap.set(modes, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

--   Modes---
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--   search_mode = "s",

-- Exit modes using jk or kj
-- I use <C-c> for c mode here because the noise command line window would hang otherwise
map("c", "jk", "<C-c>", "Go back to Normal Mode")
map("c", "kj", "<C-c>", "Go back to Normal Mode")
map({ "i", "v", "s" }, "jk", "<Esc>", "Go back to Normal Mode")
map({ "i", "v", "s" }, "kj", "<Esc>", "Go back to Normal Mode")

-- Leader mappings (also leader mappings in seperate plugin files)
map("n", "<leader>a", "ggVG", "Highlight all Text")
map("n", "<leader>sv", "<cmd>w<CR><cmd>source ~/.config/nvim/init.lua<CR>", "Source Nvim")
map("n", "f<cr>", "<cmd>w<CR><cmd>source %<CR>", "Run Current File")

-- Enter command-line window
map("n", "<leader><leader>", "q:", "Enter Command-Line-Window")

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", "Buffer Next")
map("n", "<S-h>", ":bprevious<CR>", "Buffer Previous")

-- Better window navigation
map("n", "<c-j>", "<c-w>j", "Window Nav")
map("n", "<c-k>", "<c-w>k", "Window Nav")
map("n", "<c-h>", "<c-w>h", "Window Nav")
map("n", "<c-l>", "<c-w>l", "Window Nav")

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", "Resize Window")
map("n", "<C-Down>", ":resize +2<CR>", "Resize Window")
map("n", "<C-Left>", ":vertical resize -2<CR>", "Resize Window")
map("n", "<C-Right>", ":vertical resize +2<CR>", "Resize Window")

-- Open vim configs for quick edit
map("n", "<leader>em", ":vs ~/.config/nvim/lua/v1/user-configs/keymaps.lua<CR>", "Edit Keymaps")
map("n", "<leader>eo", ":vs ~/.config/nvim/lua/v1/user-configs/options.lua<CR>", "Edit Options")

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", "Move Visual Selection Left")
map("v", ">", ">gv", "Move Visual Selection Right")

-- need the false here for noice.nvim to show command line
vim.keymap.set("n", ";", ":", { silent = false, desc = "enter commandline mode" })
