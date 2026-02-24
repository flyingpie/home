return {

	-- mason
	{
		"mason-org/mason.nvim",
		version = "*",
		opts = {
			registries = {
				"github:mason-org/mason-registry",
				"github:Crashdummyy/mason-registry",
			},
			ensure_installed = {
				"clangd",
				"codelldb",
				"csharpier",
				"css-lsp",
				"eslint-lsp",
				"html-lsp",
				"json-lsp",
				"lua-language-server",
				"prettier",
				"roslyn",
				"stylua",
				"typescript-language-server",
				"xmlformatter",
				"zls",
			},
		},
	},

	-- nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		version = "*",
	},

	-- obsidian
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			ui = {
				enable = false,
			},
			workspaces = {
				{
					name = "notes",
					path = "~/syncthing/main/notes",
				},
			},
		},
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"c_sharp",
				"cpp",
				"css",
				"gitignore",
				"html",
				"http",
				"ini",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"razor",
				"regex",
				"scss",
				"sql",
				"svelte",
				"terraform",
				"typescript",
				"vim",
				"vue",
				"xml",
				"yaml",
				"zig",
			},
		},
	},
}
