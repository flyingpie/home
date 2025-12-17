local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	checker = {
		enabled = true, -- check for plugin updates periodically
		notify = false, -- notify on update
	},
	defaults = {
		lazy = false,
		version = "*", -- try installing the latest stable version for plugins that support semver
	},
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },

		-- Extras
		{ import = "lazyvim.plugins.extras.editor.outline" },

		{ import = "lazyvim.plugins.extras.lang.clangd" },
		{ import = "lazyvim.plugins.extras.lang.docker" },
		{ import = "lazyvim.plugins.extras.lang.git" },
		{ import = "lazyvim.plugins.extras.lang.helm" },
		{ import = "lazyvim.plugins.extras.lang.java" },
		{ import = "lazyvim.plugins.extras.lang.json" },
		{ import = "lazyvim.plugins.extras.lang.markdown" },
		{ import = "lazyvim.plugins.extras.lang.sql" },
		{ import = "lazyvim.plugins.extras.lang.svelte" },
		{ import = "lazyvim.plugins.extras.lang.terraform" },
		{ import = "lazyvim.plugins.extras.lang.vue" },
		{ import = "lazyvim.plugins.extras.lang.yaml" },
		{ import = "lazyvim.plugins.extras.lang.zig" },

		-- Plugins
		{ import = "plugins" },
	},
})

-- vim.lsp.enable("csharp")

-- vim.lsp.config(
-- 	"csharp",
--
-- 	---@type vim.lsp.Config
-- 	{
-- 		cmd = { "roslyn" },
-- 		filetypes = { "zig", "zir" },
-- 		root_markers = { "zls.json", "build.zig", ".git" },
-- 		-- root_dir = function(bufnr, on_dir)
-- 		-- 	error("Root dirrrr")
-- 		-- 	local root_path = vim.fs.find("deno.json", {
-- 		-- 		upward = true,
-- 		-- 		type = "file",
-- 		-- 		path = vim.fn.getcwd(),
-- 		-- 	})[1]
-- 		--
-- 		-- 	if root_path then
-- 		-- 		on_dir(vim.fn.fnamemodify(root_path, ":h"))
-- 		-- 	end
-- 		-- end,
-- 		workspace_required = false,
-- 	}
-- )

-- vim.lsp.config(
-- 	"zls",
--
-- 	---@type vim.lsp.Config
-- 	{
-- 		cmd = { "zls" },
-- 		filetypes = { "zig", "zir" },
-- 		root_markers = { "zls.json", "build.zig", ".git" },
-- 		-- root_dir = function(bufnr, on_dir)
-- 		-- 	error("Root dirrrr")
-- 		-- 	local root_path = vim.fs.find("deno.json", {
-- 		-- 		upward = true,
-- 		-- 		type = "file",
-- 		-- 		path = vim.fn.getcwd(),
-- 		-- 	})[1]
-- 		--
-- 		-- 	if root_path then
-- 		-- 		on_dir(vim.fn.fnamemodify(root_path, ":h"))
-- 		-- 	end
-- 		-- end,
-- 		workspace_required = false,
-- 	}
-- )
