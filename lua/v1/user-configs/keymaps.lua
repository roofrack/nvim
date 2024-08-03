-- [ Some General Mappings ] -------------------------------

--   Modes---
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--   search_mode = "s",

local keymap = vim.keymap.set -- for conciseness

-- Rob you added this function to add an editable desc option for keymap options
local opts = function(desc)
	if desc == nil then
		desc = "Description Not Set"
	end
	return { noremap = true, silent = true, desc = desc } -- table of mapping options
end

-- Set leader key
vim.g.mapleader = ","

-- Easier to save but need a better one then this
keymap("n", ";", ":") -- if use opts table here it mess's up noice.nvim command line

-- Leader mappings
keymap("n", "<leader>a", "ggVG", opts("Highlight all Text")) -- highligt all text
-- keymap('n', '<leader>sv', '<cmd>w<CR><cmd>source ~/.config/nvim/lua/user/snip/init.lua<CR>', opts())
keymap("n", "<leader>sv", "<cmd>w<CR><cmd>source ~/.config/nvim/init.lua<CR>", opts("Source Nvim"))
keymap("n", "f<cr>", "<cmd>w<CR><cmd>source %<CR>", opts("Run Current File"))
-- keymap("n", "f<cr>", "<cmd>w<CR><cmd>source %<CR>")

-- Enter command-line window
keymap("n", "<leader><leader>", "q:", opts("Enter Command-Line-Window"))

-- Exit modes using jk etc...
keymap("i", "jk", "<Esc>", opts("Exit Insert M"))
keymap("i", "kj", "<Esc>", opts("Exit Insert M"))
keymap("c", "jk", "<C-c>", opts("Exit Command M"))
keymap("c", "kj", "<C-c>", opts("Exit Command M"))
keymap("v", "jk", "<Esc>", opts("Exit Visual M"))
keymap("v", "kj", "<Esc>", opts("Exit Visual M"))
keymap("s", "jk", "<Esc>", opts("Exit Search M"))
keymap("s", "kj", "<Esc>", opts("Exit Search M"))

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts("Buffer Next"))
keymap("n", "<S-h>", ":bprevious<CR>", opts("Buffer Previous"))

-- Better window navigation
keymap("n", "<c-j>", "<c-w>j", opts("Window Nav"))
keymap("n", "<c-k>", "<c-w>k", opts("Window Nav"))
keymap("n", "<c-h>", "<c-w>h", opts("Window Nav"))
keymap("n", "<c-l>", "<c-w>l", opts("Window Nav"))

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts("Resize Window"))
keymap("n", "<C-Down>", ":resize +2<CR>", opts("Resize Window"))
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts("Resize Window"))
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts("Resize Window"))

-- Open vim configs for quick edit
keymap("n", "<leader>em", ":vs ~/.config/nvim/lua/v1/user-configs/keymaps.lua<CR>", opts("Open Keymaps for editing"))
keymap("n", "<leader>eo", ":vs ~/.config/nvim/lua/v1/user-configs/options.lua<CR>", opts("Open Options for editing"))

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts("Move Visual Selection Left"))
keymap("v", ">", ">gv", opts("Move Visual Selection Right"))

-- [ Plugin mappings ] -------------------------------------
-- these probably should go in the seperate plugin files

-- NvimTreeToggle
-- keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- VimTmuxRunner
-- I mapped this in the Vtr plugin file
-- keymap("n", "f<CR>", ":VtrSendFile<CR>", opts)

-- Nvim Autopairs
-- keymap("i", "<C-l>", "<Esc>A ", opts)
keymap("i", "<C-l>", "<Esc>%%a", opts("Autopairs Movement"))
