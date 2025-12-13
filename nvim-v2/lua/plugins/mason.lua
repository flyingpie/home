return {

	-- Mason
	{
		"mason-org/mason.nvim",
		opts = {
			registries = {
				"github:mason-org/mason-registry",
				"github:Crashdummyy/mason-registry",
			},
			ensure_installed = {
				"lua-language-server",

				"xmlformatter",
				"csharpier",
				"prettier",

				"stylua",
				"bicep-lsp",
				"html-lsp",
				"css-lsp",
				"eslint-lsp",
				"typescript-language-server",
				"json-lsp",
				"rust-analyzer",

				"roslyn",
			},
		},
	},

	-- Roslyn
	{
		"seblyng/roslyn.nvim",
		---@module 'roslyn.config'
		---@type RoslynNvimConfig
		ft = { "cs", "razor" },
		init = function()
			vim.lsp.enable("roslyn")
		end,
		lazy = false,
		opts = {
			broad_search = true,
			silent = false,
		},
	},
}
