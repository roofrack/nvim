------------------------------------------------------------
-- Some General Mappings
------------------------------------------------------------
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }
--local opts = { noremap = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Set leader key
vim.g.mapleader = ','

-- Easier to save but need a better one then this
keymap('n', ';', ':', {})

-- Exit modes using jk etc... 
keymap('i', 'jk', '<Esc>', opts)
keymap('i', 'kj', '<Esc>', opts)
keymap('c', 'jk', '<Esc>', opts)
keymap('c', 'kj', '<Esc>', opts)
keymap('v', 'jk', '<Esc>', opts)
keymap('v', 'kj', '<Esc>', opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Better window navigation
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-h>', '<c-w>', opts)
keymap('n', '<c-l>', '<c-w>l', opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Open vim configs for quick edit
keymap('n', '<leader>ek', ':vsplit<cr>:e ~/.config/nvim/lua/user/keymaps.lua<CR>', opts)
keymap('n', '<leader>eo', ':vsplit<cr>:e ~/.config/nvim/lua/user/options.lua<CR>', opts)

-- NvimTreeToggle
keymap("n", "<C-n>", [[:NvimTreeToggle<CR>]], opts)

