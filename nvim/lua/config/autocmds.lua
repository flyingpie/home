-- Override LazyVim's wrap_spell autocmd: keep wrap OFF, leave spell on
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = false
	end,
})
