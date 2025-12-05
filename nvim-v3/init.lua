
vim.o.number = true
vim.o.relativenumber = true
vim.o.swapfile = false

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")

vim.pack.add({
	{src = "https://github.com/Mofiqul/vscode.nvim"}
})

vim.cmd("colorscheme vscode")
