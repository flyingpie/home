return {

	-- blink.cmp
	-- Provides autocompletion.
	-- https://github.com/Saghen/blink.cmp
	{
		"Saghen/blink.cmp",
	},

	-- bufferline.nvim
	-- Tab bar.
	-- https://github.com/akinsho/bufferline.nvim
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

	-- gitsigns.nvim
	-- Shows git status on the left of a buffer.
	-- https://github.com/lewis6991/gitsigns.nvim
	{
		"lewis6991/gitsigns.nvim",
		version = "*",
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
		},
	},

	-- mini.map
	-- Mini map on the right.
	-- https://github.com/nvim-mini/mini.map
	{
		"nvim-mini/mini.map",
		version = "*",
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

	-- nvim-web-devicons
	-- Provides Nerd Font icons.
	-- https://github.com/nvim-tree/nvim-web-devicons
	{
		"nvim-tree/nvim-web-devicons",
		version = "*",
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

	-- VSCode
	{
		"flyingpie/vscode.nvim", -- Remote version
		-- name = "vscode.nvim",
		-- dir = "~/workspace/flyingpie/vscode.nvim", -- Local version
		branch = "custom",
		opts = {
			-- stylua: ignore
			color_overrides = {
				vscCursorDarkDark = "#101010",		-- Selected line background (includes selected file in file browser)
				vscPopupBack = "#090909",			-- Modal background (includes minimap)
				vscWhitespace = "#333355",			-- Whitespace chars, including tabs and spaces
				vscNonText = "#333355",				-- End of lines, LSP inlays, and some other stuff

				vscTabLineFill = "#999999",			-- Tab line background (including between tabs)
				vscTabOutside = "#111111",			-- Tab line background (tabs themselves)
			},
			transparent = true,
		},
	},

	-- which-key.nvim
	-- Shows a popup with available keymaps.
	-- https://github.com/folke/which-key.nvim
	{
		"folke/which-key.nvim",
		version = "*",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
