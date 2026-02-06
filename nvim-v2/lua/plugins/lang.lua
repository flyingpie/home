return {

	-- {
	-- 	"mrcjkb/rustaceanvim",
	-- 	version = "*",
	-- 	lazy = false,
	-- },

	-- {
	-- 	"cordx56/rustowl",
	-- 	version = "*", -- Latest stable version
	-- 	build = "cargo binstall rustowl",
	-- 	lazy = false, -- This plugin is already lazy
	-- 	opts = {
	-- 		auto_attach = true, -- Auto attach the RustOwl LSP client when opening a Rust file
	-- 		auto_enable = false, -- Enable RustOwl immediately when attaching the LSP client
	-- 		client = {
	-- 			on_attach = function(_, buffer)
	-- 				vim.keymap.set("n", "<leader>o", function()
	-- 					require("rustowl").toggle(buffer)
	-- 				end, { buffer = buffer, desc = "Toggle RustOwl" })
	-- 			end,
	-- 		},
	-- 	},
	-- },

	{
		"mrcjkb/rustaceanvim",
		ft = { "rust" },
		init = function()
			vim.g.rustaceanvim = {
				tools = {
					test_executor = "background",
				},
				server = {
					-- https://users.rust-lang.org/t/neovim-vs-blocking-waiting-for-file-lock-on-build-directory/72188
					cmd_env = {
						CARGO_TARGET_DIR = "target/lsp",
					},
					default_settings = {
						["rust-analyzer"] = {
							cargo = {
								allFeatures = true,
							},
							rustfmt = {
								extraArgs = { "+nightly" },
							},
						},
					},
					-- stylua: ignore
					on_attach = function(_, bufnr)
						local lsp_map = function(mode, keys, func, desc)
						vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
						end

						-- rust-lsp
						lsp_map("n", "K", function() vim.cmd.RustLsp({ "hover", "actions" }) end, "Rust hover docs")
						lsp_map("n", "J", function() vim.cmd.RustLsp("joinLines") end, "Rust join lines")
						lsp_map("n", "<Leader>ca", function() vim.cmd.RustLsp("codeAction") end, "Rust Code action")
						lsp_map("n", "<Leader>rue", function() vim.cmd.RustLsp("explainError") end, "Rust error explain")
						lsp_map("n", "<Leader>rud", function() vim.cmd.RustLsp("openDocs") end, "Rust docs")
						lsp_map("n", "<Leader>rum", function() vim.cmd.RustLsp("expandMacro") end, "Rust expand macro")
						lsp_map("n", "<Leader>rut", function() vim.cmd.RustLsp("testables") end, "Rust test")

						-- Copy from lsp_config
						lsp_map("n", "gd", vim.lsp.buf.definition, "Goto definition")
						lsp_map("n", "gD", vim.lsp.buf.declaration, "Goto declaration")
						lsp_map("n", "gI", vim.lsp.buf.implementation, "Goto implementation")
						lsp_map("n", "gT", vim.lsp.buf.type_definition, "Goto type definition")
						lsp_map("n", "<Leader>rs", vim.lsp.buf.rename, "Rename symbol")
						-- lsp_map("n", "<Leader>ds", require("telescope.builtin").lsp_document_symbols, "Document symbols")
						-- lsp_map("n", "<Leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace symbols")

						-- Format on save
						local format_sync_grp = vim.api.nvim_create_augroup("RustaceanFormat", {})
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = bufnr,
							callback = function() vim.lsp.buf.format() end,
							group = format_sync_grp,
						})
					end,
				},
			}
		end,
	},

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
				-- "rust-analyzer",
				"stylua",
				"typescript-language-server",
				"xmlformatter",
				"zls",
			},
		},
	},

	-- markdown
	{
		"MeanderingProgrammer/render-markdown.nvim",
		version = "*",
		opts = {
			code = { -- Makes code blocks stay put when moving the cursor over them, and when switching modes.
				border = "none",
				conceal_delimiters = false,
			},
		},
	},

	-- nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		version = "*",
		-- enabled = false,
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
