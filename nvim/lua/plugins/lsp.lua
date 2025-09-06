return {

	-- Mason
	-- Package manager for LSPs, DAPS, linters and formatters
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		build = ":MasonUpdate",
		lazy = false,
		opts_extend = { "ensure_installed" },
		opts = {
			ensure_installed = {
				"csharpier",
				"helm-ls",
				"html-lsp",
				"json-lsp",
				"lua-language-server",
				"powershell-editor-services",
				"shfmt",
				"stylua",
				"terraform-ls",
				"tflint",
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

	-- -- Mason LSP Config
	-- -- Bridges mason and nvim-lspconfig
	-- {
	-- 	"williamboman/mason-lspconfig.nvim",
	-- 	config = function() end,
	-- 	lazy = false,
	-- },

	-- NVIM LSP Config
	--
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		opts = {
			servers = {
				yamlls = {
					settings = {
						yaml = {
							keyOrdering = false,
							format = {
								enable = true,
							},
							validate = true,
							schemaStore = {
								enable = false, -- disable built-in schema store to use custom
							},
							schemas = {
								kubernetes = "k8s-*.yaml",
								["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
								["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
								["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/**/*.{yml,yaml}",
								["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
								["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
								["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
								["http://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}",
							},
						},
					},
				},
			},
		},
	},
}
