-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local opts = { noremap = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap


keymap("", "<Space>", "<Nop>", opts)

-- Use 'jj' to exit INSERT mode
--keymap("i", "jj", "<ESC>", opts)

--keymap("n", "<leader>e", "Neotree<cr>", opts)	-- Open tree

keymap("n", "<A-z>", ":set wrap!<CR>", opts)	-- Toggle line wrap

-- Remap delete/change to black hole register
keymap("n", "d", '"_d', { noremap = true })
keymap("n", "c", '"_c', { noremap = true })
-- keymap("n", "x", '"_x', { noremap = true })

keymap("v", "d", '"_d', { noremap = true })
keymap("v", "c", '"_c', { noremap = true })
-- keymap("v", "x", '"_x', { noremap = true })

-- Window split
keymap("n", "<C-->", "<C-w>s", opts)			-- Split horizontally
-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)			-- Move left
keymap("n", "<C-j>", "<C-w>j", opts)			-- Move down
keymap("n", "<C-k>", "<C-w>k", opts)			-- Move up
keymap("n", "<C-l>", "<C-w>l", opts)			-- Move right

-- Window resize
keymap("n",		"<C-Up>",		":resize -2<CR>",			opts)
keymap("n",		"<C-Down>",		":resize +2<CR>",			opts)
keymap("n",		"<C-Left>",		":vertical resize -2<CR>",	opts)
keymap("n",		"<C-Right>",	":vertical resize +2<CR>",	opts)

--keymap("n",		"<leader>q",	":bp<bar>sp<bar>bn<bar>bd<CR>", opts)
keymap("n",		"<C-w>",	":bp<bar>sp<bar>bn<bar>bd<CR>", opts)

-- Fuzzy Finder
local builtin = require("telescope.builtin")
vim.keymap.set("n",		"<leader>ff",	builtin.find_files,		opts)
vim.keymap.set("n",		"<leader>fg",	builtin.live_grep,		opts)
vim.keymap.set("n",		"<leader>fc",	builtin.commands,		opts)
--keymap('n', '<leader>fb', builtin.buffers, {})
--keymap('n', '<leader>fh', builtin.help_tags, {})

keymap('n',	'<Tab>',	':EagleWin<CR>',	opts)

vim.keymap.set("n",		"<leader>.",		vim.lsp.buf.code_action, opts)
vim.keymap.set("n",		"<leader>r",		vim.lsp.buf.rename, opts)

