return {

	-- bufferline
	{
		"akinsho/bufferline.nvim",
		version = "*",
		opts = {
			-- stylua: ignore
			options = {
				diagnostics = "nvim_lsp",
				max_name_length = 40,								-- Longer max length, so we can still see longer file names.
				name_formatter = function(buf)
					return string.format("  %s  ", buf.name)		-- Some margin around the tab name
				end,
			},
		},
	},

	{
		"sindrets/diffview.nvim",
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

	-- outline
	{
		"hedyhli/outline.nvim",
		version = "*",
		opts = {
			outline_window = {
				position = "right",
				show_numbers = true,
				show_relative_numbers = true,
				split_command = nil,
				width = 30,
			},

			symbol_folding = {
				autofold_depth = false,
			},

			preview_window = {
				auto_preview = true,
			},

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
