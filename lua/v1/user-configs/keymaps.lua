-- [ Some General Mappings ] -------------------------------

--   Modes---
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--   search_mode = "s",

-- Set leader key
vim.g.mapleader = ","

local map = function(modes, lhs, rhs, desc)
	vim.keymap.set(modes, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

-- Easier to save but need a better one then this
vim.keymap.set("n", ";", ":", { silent = false, desc = "enter commandline mode" })
-- need the false here for noice.nvim to show command line

-- Leader mappings (also leader mappings in seperate plugin files)
map("n", "<leader>a", "ggVG", "Highlight all Text")
map("n", "<leader>sv", "<cmd>w<CR><cmd>source ~/.config/nvim/init.lua<CR>", "Source Nvim")
map("n", "f<cr>", "<cmd>w<CR><cmd>source %<CR>", "Run Current File")

-- Enter command-line window
map("n", "<leader><leader>", "q:", "Enter Command-Line-Window")

-- Exit modes using jk etc...
map("i", "jk", "<Esc>", "Exit Insert M")
map("i", "kj", "<Esc>", "Exit Insert M")
map("c", "jk", "<C-c>", "Exit Command M")
map("c", "kj", "<C-c>", "Exit Command M")
map("v", "jk", "<Esc>", "Exit Visual M")
map("v", "kj", "<Esc>", "Exit Visual M")
map("s", "jk", "<Esc>", "Exit Search M")
map("s", "kj", "<Esc>", "Exit Search M")

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
map("n", "<leader>em", ":vs ~/.config/nvim/lua/v1/user-configs/keymaps.lua<CR>", "Open Keymaps for editing")
map("n", "<leader>eo", ":vs ~/.config/nvim/lua/v1/user-configs/options.lua<CR>", "Open Options for editing")

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", "Move Visual Selection Left")
map("v", ">", ">gv", "Move Visual Selection Right")
