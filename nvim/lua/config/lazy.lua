local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
	checker = {
		enabled = false, -- automatically check for plugin updates
		notify = true, -- get a notification when new updates are found
	},
	defaults = {
		version = false, -- always use the latest git commit
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"zipPlugin",
			},
		},
	},
	spec = {
		-- add LazyVim and import its plugins
		{ "LazyVim/LazyVim",                          import = "lazyvim.plugins" },
		-- import any extras modules here
		{ import = "lazyvim.plugins.extras.lang.json" },
		-- { import = "lazyvim.plugins.extras.ui.mini-animate" },
		-- import/override with your plugins
		{ import = "plugins" },
	},
})
