return {

	-- blink.cmp
	{
		"saghen/blink.cmp",
		version = "*",
		config = function()
			require("blink.cmp").setup({
				fuzzy = { implementation = "prefer_rust_with_warning" },
				keymap = {
					preset = "enter",
				},
				sources = {
					default = { "lsp", "easy-dotnet", "path", "snippets" },
					providers = {
						["easy-dotnet"] = {
							name = "easy-dotnet",
							enabled = true,
							module = "easy-dotnet.completion.blink",
							score_offset = 10000,
							async = true,
						},
					},
				},
			})
		end,
	},

	-- bufferline
	{
		"akinsho/bufferline.nvim",
		version = "*",
		opts = {
			-- stylua: ignore
			options = {
				always_show_bufferline = true,
				diagnostics = "nvim_lsp",
				max_name_length = 40,								-- Longer max length, so we can still see longer file names.
				name_formatter = function(buf)
					return string.format("  %s  ", buf.name)		-- Some margin around the tab name
				end,
			},
		},
	},

	-- diffview
	{
		"sindrets/diffview.nvim",
		opts = {
			view = {
				default = {
					-- Config for changed files, and staged files in diff views.
					layout = "diff2_horizontal",
					disable_diagnostics = false, -- Temporarily disable diagnostics for diff buffers while in the view.
					winbar_info = false, -- See |diffview-config-view.x.winbar_info|
				},
				merge_tool = {
					-- Config for conflicted files in diff views during a merge or rebase.
					layout = "diff3_mixed",
					disable_diagnostics = true, -- Temporarily disable diagnostics for diff buffers while in the view.
					winbar_info = true, -- See |diffview-config-view.x.winbar_info|
				},
				file_history = {
					-- Config for changed files in file history views.
					layout = "diff2_horizontal",
					disable_diagnostics = false, -- Temporarily disable diagnostics for diff buffers while in the view.
					winbar_info = false, -- See |diffview-config-view.x.winbar_info|
				},
			},
		},
	},

	-- image
	{
		"3rd/image.nvim",
		version = "*",
		build = false,
		opts = {
			processor = "magick_cli",
		},
	},

	-- lualine.nvim
	-- Status line at the bottom.
	-- https://github.com/nvim-lualine/lualine.nvim
	{
		"nvim-lualine/lualine.nvim",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			options = {
				theme = "iceberg_dark",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		},
	},

	-- mini
	{
		"nvim-mini/mini.nvim",
		event = "VeryLazy",
		-- stylua: ignore
		keys = {
			{ "<leader>mc", "<cmd>lua MiniMap.close()<CR>",				desc = "Close" },
			{ "<leader>mo", "<cmd>lua MiniMap.open()<CR>",				desc = "Open" },
			{ "<leader>mm", "<cmd>lua MiniMap.toggle()<CR>",			desc = "Toggle" },
			{ "<leader>mf", "<cmd>lua MiniMap.toggle_focus()<CR>",		desc = "Focus" },
			{ "<leader>mr", "<cmd>lua MiniMap.refresh()<CR>",			desc = "Refresh" },
		},
		opts = function(_, _)
			local mini_map = require("mini.map")

			return {
				integrations = {
					mini_map.gen_integration.builtin_search(),
					mini_map.gen_integration.diagnostic(),
					mini_map.gen_integration.diff(),
					mini_map.gen_integration.gitsigns(),
				},
				symbols = {
					encode = mini_map.gen_encode_symbols.dot("4x2"),
				},
			}
		end,
		config = function(_, opts)
			local mini_map = require("mini.map")
			mini_map.setup(opts)
			mini_map.open()
		end,
	},

	-- nvim-treesitter-context
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
			enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
			multiwindow = true, -- Enable multiwindow support.
			max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
			min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
			line_numbers = true,
			multiline_threshold = 20, -- Maximum number of lines to show for a single context
			trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
			mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
			-- Separator between context and content. Should be a single character string, like '-'.
			-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
			separator = nil, -- "┈",
			zindex = 20, -- The Z-index of the context window
			on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
		},
	},

	-- outline
	{
		"hedyhli/outline.nvim",
		version = "*",
		opts = {
			-- stylua: ignore
			keymaps = {
				close					= "<Esc>",
				code_actions			= "a",
				down_and_jump			= "<C-j>",		-- Move down/up by one line and peek_location immediately. You can also use outline_window.auto_jump=true to do this for any j/k/<down>/<up>.
				fold					= "h",			-- These fold actions are collapsing tree nodes, not code folding
				fold_all				= "W",
				fold_reset				= "R",
				fold_toggle				= "<Tab>",
				fold_toggle_all			= "<S-Tab>",	-- Toggle folds for all nodes. If at least one node is folded, this action will fold all nodes. If all nodes are folded, this action will unfold all nodes.
				goto_and_close			= "<Cr>",		-- Visit location in code and close outline immediately
				goto_location			= nil, -- "<Cr>",		-- Jump to symbol under cursor.
				hover_symbol			= "<C-space>",	-- Open LSP/provider-dependent symbol hover information
				peek_location			= "o",			-- Jump to symbol under cursor but keep focus on outline window.
				rename_symbol			= "r",
				restore_location		= "<C-g>",		-- Change cursor position of outline window to match current location in code.
				show_help				= "?",
				toggle_preview			= "K",			-- Preview location code of the symbol under cursor
				unfold					= "l",
				unfold_all				= "E",
				up_and_jump				= "<C-k>",
			},

			outline_window = {
				position = "right",
				show_numbers = true,
				show_relative_numbers = true,
				split_command = nil,
				width = 30,
			},

			preview_window = {
				auto_preview = false,
			},

			symbol_folding = {
				autofold_depth = false,
			},
		},
	},

	-- smear-cursor
	{
		"sphamba/smear-cursor.nvim",
		event = "VeryLazy",
		opts = {
			hide_target_hack = true,
			cursor_color = "none",
		},
	},

	-- trouble
	{
		"folke/trouble.nvim",
		version = "*",
		opts = { use_diagnostic_signs = true },
	},

	-- web-devicons
	{
		"nvim-tree/nvim-web-devicons",
		branch = "master",
		opts = {},
	},
}
