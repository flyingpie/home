-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local opts = { noremap = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("", "<Space>", "<Nop>", opts)

-- Use 'jj' to exit INSERT mode
--keymap("i", "jj", "<ESC>", opts)

-- Open tree
keymap("n", "<leader>e", "Neotree<cr>", opts)

-- Window split
keymap("n", "<C-->", "<C-w>s", opts)		-- Split horizontally
-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)		-- Move left
keymap("n", "<C-j>", "<C-w>j", opts)		-- Move down
keymap("n", "<C-k>", "<C-w>k", opts)		-- Move up
keymap("n", "<C-l>", "<C-w>l", opts)		-- Move right

-- Window resize
keymap("n",		"<C-Up>",		":resize -2<CR>", opts)
keymap("n",		"<C-Down>",		":resize +2<CR>", opts)
keymap("n",		"<C-Left>",		":vertical resize -2<CR>", opts)
keymap("n",		"<C-Right>",	":vertical resize +2<CR>", opts)

-- Fuzzy Finder
local builtin = require("telescope.builtin")
vim.keymap.set("n",		"<leader>ff",	builtin.find_files,		opts)
vim.keymap.set("n",		"<leader>fg",	builtin.live_grep,		opts)

--keymap('n', '<leader>fb', builtin.buffers, {})
--keymap('n', '<leader>fh', builtin.help_tags, {})

