-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Use "jsonc" filetype for "json" files, so we can use comments and such.
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.json",
	callback = function()
		vim.bo.filetype = "jsonc"
	end,
})

vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
