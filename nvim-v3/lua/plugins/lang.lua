return {

	-- conform.nvim
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" }, -- format on save
		cmd = { "ConformInfo" },
		opts = {
			-- Formatters by FileType
			formatters_by_ft = {
				cs = { "csharpier" },
				xml = { "csharpier" },
			},
		},
	},

	-- mason.nvim
	-- Installs LSPs, DAPs, linters and formatters.
	-- https://github.com/mason-org/mason.nvim
	{

		"mason-org/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		build = ":MasonUpdate",
		opts_extend = { "ensure_installed" },
		opts = {
			registries = {
				"github:mason-org/mason-registry",
				"github:Crashdummyy/mason-registry",
			},
			ensure_installed = {
				"bash-language-server",
				"clangd",
				"codelldb",
				"csharpier",
				"css-lsp",
				"editorconfig-checker",
				"eslint-lsp",
				"html-lsp",
				"json-lsp",
				"lua-language-server",
				"powershell-editor-services",
				"prettier",
				-- "roslyn",
				"shfmt",
				"stylua",
				"typescript-language-server",
				"xmlformatter",
			},
		},
		---@param opts MasonSettings | {ensure_installed: string[]}
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			mr:on("package:install:success", function()
				vim.defer_fn(function()
					-- trigger FileType event to possibly load this newly installed LSP server
					require("lazy.core.handler.event").trigger({
						event = "FileType",
						buf = vim.api.nvim_get_current_buf(),
					})
				end, 100)
			end)

			mr.refresh(function()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end)
		end,
	},

	-- mason-lspconfig.nvim
	-- Wires up Mason and LSP.
	-- https://github.com/mason-org/mason-lspconfig.nvim
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			automatic_enable = true,
			ensure_installed = {
				-- "bash-language-server",
				"bashls",
				"clangd",
				-- "codelldb",
				-- "csharpier",
				-- "css-lsp",
				"dockerls",
				-- "editorconfig-checker",
				-- "eslint-lsp",
				"html",
				-- "json-lsp",
				-- "lua-language-server",
				"lua_ls",
				-- "powershell-editor-services",
				"powershell_es",
				-- "prettier",
				-- "roslyn",
				"stylua",
				-- "typescript-language-server",
				-- "xmlformatter",
			},
		},
	},

	-- nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		version = "*",
	},

	-- nvim-treesitter
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
				"java",
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
