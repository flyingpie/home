-- Use "jsonc" filetype for "json" files, so we can use comments and such.
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.json",
	callback = function()
		vim.bo.filetype = "jsonc"
	end,
})
