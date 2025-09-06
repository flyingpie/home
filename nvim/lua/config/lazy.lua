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
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },

		-- Extras
		{ import = "lazyvim.plugins.extras.lang.docker" },
		{ import = "lazyvim.plugins.extras.lang.git" },
		{ import = "lazyvim.plugins.extras.lang.helm" },
		{ import = "lazyvim.plugins.extras.lang.json" },
		{ import = "lazyvim.plugins.extras.lang.omnisharp" },
		{ import = "lazyvim.plugins.extras.lang.sql" },
		{ import = "lazyvim.plugins.extras.lang.terraform" },
		{ import = "lazyvim.plugins.extras.lang.yaml" },

		-- Plugins
		{ import = "plugins" },
	},
})
