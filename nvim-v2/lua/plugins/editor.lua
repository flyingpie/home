return {

	-- bufferline
	{
		"akinsho/bufferline.nvim",
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

	-- minimap
	---@module "neominimap.config.meta"
	{
		"Isrothy/neominimap.nvim",
		version = "^3.0.0",
		lazy = false,
		keys = {
			{ "<leader>mm", "<cmd>Neominimap Toggle<cr>", desc = "Toggle global minimap" },
		},
		init = function()
			---@type Neominimap.UserConfig
			vim.g.neominimap = {
				auto_enable = true,
				layout = "split",
			}
		end,
	},

	-- outline
	{
		"hedyhli/outline.nvim",
		opts = {
			outline_window = {
				-- Where to open the split window: right/left
				position = "right",
				split_command = nil,
				width = 25,
				show_numbers = true,
				show_relative_numbers = true,
				-- wrap = false,
			},

			symbol_folding = {
				autofold_depth = false,
			},

			preview_window = {
				auto_preview = true,
			},

			-- These keymaps can be a string or a table for multiple keys.
			-- Set to `{}` to disable. (Using 'nil' will fallback to default keys)
			keymaps = {
				show_help = "?",
				close = { "<Esc>", "q" },
				-- Jump to symbol under cursor.
				-- It can auto close the outline window when triggered, see
				-- 'auto_close' option above.
				goto_location = "<Cr>",
				-- Jump to symbol under cursor but keep focus on outline window.
				peek_location = "o",
				-- Visit location in code and close outline immediately
				goto_and_close = "<S-Cr>",
				-- Change cursor position of outline window to match current location in code.
				-- 'Opposite' of goto/peek_location.
				restore_location = "<C-g>",
				-- Open LSP/provider-dependent symbol hover information
				hover_symbol = "<C-space>",
				-- Preview location code of the symbol under cursor
				toggle_preview = "K",
				rename_symbol = "r",
				code_actions = "a",
				-- These fold actions are collapsing tree nodes, not code folding
				fold = "h",
				unfold = "l",
				fold_toggle = "<Tab>",
				-- Toggle folds for all nodes.
				-- If at least one node is folded, this action will fold all nodes.
				-- If all nodes are folded, this action will unfold all nodes.
				fold_toggle_all = "<S-Tab>",
				fold_all = "W",
				unfold_all = "E",
				fold_reset = "R",
				-- Move down/up by one line and peek_location immediately.
				-- You can also use outline_window.auto_jump=true to do this for any
				-- j/k/<down>/<up>.
				down_and_jump = "<C-j>",
				up_and_jump = "<C-k>",
			},
		},
	},

	-- snacks
	{
		"folke/snacks.nvim",
		---@type snacks.Config
		opts = {

			picker = {
				sources = {
					explorer = {
						layout = {
							preset = "sidebar",
							layout = {
								box = "vertical",
								position = "left",
								width = 50,
								{ win = "input", height = 1, border = "bottom" },
								{ win = "list", border = "none" },
								{ win = "preview", title = "{preview}", height = 0.4, border = "top" },
							},
						},
						win = {
							list = {
								wo = {
									number = true,
									relativenumber = true,
								},
							},
						},
					},
				},
			},

			scroll = {
				enabled = false,
				-- animate = {
				-- 	duration = { step = 10, total = 100 },
				-- 	easing = "linear",
				-- },
				-- faster animation when repeating scroll after delay
				-- animate_repeat = {
				-- 	delay = 50, -- delay in ms before using the repeat animation
				-- 	duration = { step = 3, total = 20 },
				-- 	easing = "linear",
				-- },
			},
		},
		-- stylua: ignore
		keys = {

			-- Top Pickers & Explorer
			{ "<leader><space>",		function() Snacks.picker.smart() end,					desc = "Smart Find Files", },
			{ "<leader>,",				function() Snacks.picker.buffers() end,					desc = "Buffers", },
			{ "<leader>/",				function() Snacks.picker.grep() end,					desc = "Grep", },
			{ "<leader>:",				function() Snacks.picker.command_history() end,			desc = "Command History", },
			{ "<leader>n",				function() Snacks.picker.notifications()		end,	desc = "Notification History",
			},
			{
				"<leader>e",
				function()
					Snacks.explorer()
				end,
				desc = "File Explorer",
			},
			-- find
			{
				"<leader>fb",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>fc",
				function()
					Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Find Config File",
			},
			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files",
			},
			-- { "<leader>fg",      function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
			{
				"<leader>fp",
				function()
					Snacks.picker.projects()
				end,
				desc = "Projects",
			},
			{
				"<leader>fr",
				function()
					Snacks.picker.recent()
				end,
				desc = "Recent",
			},
			-- git
			{
				"<leader>gb",
				function()
					Snacks.picker.git_branches()
				end,
				desc = "Git Branches",
			},
			{
				"<leader>gl",
				function()
					Snacks.picker.git_log()
				end,
				desc = "Git Log",
			},
			{
				"<leader>gL",
				function()
					Snacks.picker.git_log_line()
				end,
				desc = "Git Log Line",
			},
			{
				"<leader>gs",
				function()
					Snacks.picker.git_status()
				end,
				desc = "Git Status",
			},
			{
				"<leader>gS",
				function()
					Snacks.picker.git_stash()
				end,
				desc = "Git Stash",
			},
			{
				"<leader>gd",
				function()
					Snacks.picker.git_diff()
				end,
				desc = "Git Diff (Hunks)",
			},
			{
				"<leader>gf",
				function()
					Snacks.picker.git_log_file()
				end,
				desc = "Git Log File",
			},
			-- Grep
			{
				"<leader>sb",
				function()
					Snacks.picker.lines()
				end,
				desc = "Buffer Lines",
			},
			{
				"<leader>sB",
				function()
					Snacks.picker.grep_buffers()
				end,
				desc = "Grep Open Buffers",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>sw",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "Visual selection or word",
				mode = { "n", "x" },
			},
			-- search
			{
				'<leader>s"',
				function()
					Snacks.picker.registers()
				end,
				desc = "Registers",
			},
			{
				"<leader>s/",
				function()
					Snacks.picker.search_history()
				end,
				desc = "Search History",
			},
			{
				"<leader>sa",
				function()
					Snacks.picker.autocmds()
				end,
				desc = "Autocmds",
			},
			{
				"<leader>sb",
				function()
					Snacks.picker.lines()
				end,
				desc = "Buffer Lines",
			},
			{
				"<leader>sc",
				function()
					Snacks.picker.command_history()
				end,
				desc = "Command History",
			},
			{
				"<leader>sC",
				function()
					Snacks.picker.commands()
				end,
				desc = "Commands",
			},
			{
				"<leader>sd",
				function()
					Snacks.picker.diagnostics()
				end,
				desc = "Diagnostics",
			},
			{
				"<leader>sD",
				function()
					Snacks.picker.diagnostics_buffer()
				end,
				desc = "Buffer Diagnostics",
			},
			{
				"<leader>sh",
				function()
					Snacks.picker.help()
				end,
				desc = "Help Pages",
			},
			{
				"<leader>sH",
				function()
					Snacks.picker.highlights()
				end,
				desc = "Highlights",
			},
			{
				"<leader>si",
				function()
					Snacks.picker.icons()
				end,
				desc = "Icons",
			},
			{
				"<leader>sj",
				function()
					Snacks.picker.jumps()
				end,
				desc = "Jumps",
			},
			{
				"<leader>sk",
				function()
					Snacks.picker.keymaps()
				end,
				desc = "Keymaps",
			},
			{
				"<leader>sl",
				function()
					Snacks.picker.loclist()
				end,
				desc = "Location List",
			},
			{
				"<leader>sm",
				function()
					Snacks.picker.marks()
				end,
				desc = "Marks",
			},
			{
				"<leader>sM",
				function()
					Snacks.picker.man()
				end,
				desc = "Man Pages",
			},
			{
				"<leader>sp",
				function()
					Snacks.picker.lazy()
				end,
				desc = "Search for Plugin Spec",
			},
			{
				"<leader>sq",
				function()
					Snacks.picker.qflist()
				end,
				desc = "Quickfix List",
			},
			{
				"<leader>sR",
				function()
					Snacks.picker.resume()
				end,
				desc = "Resume",
			},
			{
				"<leader>su",
				function()
					Snacks.picker.undo()
				end,
				desc = "Undo History",
			},
			{
				"<leader>uC",
				function()
					Snacks.picker.colorschemes()
				end,
				desc = "Colorschemes",
			},
			-- LSP
			{"gd",function()Snacks.picker.lsp_definitions()	end,	desc = "Goto Definition",},
			{
				"gD",
				function()
					Snacks.picker.lsp_declarations()
				end,
				desc = "Goto Declaration",
			},
			{
				"gr",
				function()
					Snacks.picker.lsp_references()
				end,
				nowait = true,
				desc = "References",
			},
			{
				"gI",
				function()
					Snacks.picker.lsp_implementations()
				end,
				desc = "Goto Implementation",
			},
			{
				"gy",
				function()
					Snacks.picker.lsp_type_definitions()
				end,
				desc = "Goto T[y]pe Definition",
			},
			{
				"<leader>ss",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "LSP Symbols",
			},
			{
				"<leader>sS",
				function()
					Snacks.picker.lsp_workspace_symbols()
				end,
				desc = "LSP Workspace Symbols",
			},
			-- Other
			{
				"<leader>z",
				function()
					Snacks.zen()
				end,
				desc = "Toggle Zen Mode",
			},
			{
				"<leader>Z",
				function()
					Snacks.zen.zoom()
				end,
				desc = "Toggle Zoom",
			},
			{
				"<leader>.",
				function()
					Snacks.scratch()
				end,
				desc = "Toggle Scratch Buffer",
			},
			{
				"<leader>S",
				function()
					Snacks.scratch.select()
				end,
				desc = "Select Scratch Buffer",
			},
			{
				"<leader>n",
				function()
					Snacks.notifier.show_history()
				end,
				desc = "Notification History",
			},
			{
				"<leader>bd",
				function()
					Snacks.bufdelete()
				end,
				desc = "Delete Buffer",
			},
			{
				"<leader>cR",
				function()
					Snacks.rename.rename_file()
				end,
				desc = "Rename File",
			},
			{
				"<leader>gB",
				function()
					Snacks.gitbrowse()
				end,
				desc = "Git Browse",
				mode = { "n", "v" },
			},
			{
				"<leader>gg",
				function()
					Snacks.lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>un",
				function()
					Snacks.notifier.hide()
				end,
				desc = "Dismiss All Notifications",
			},
			{
				"<c-/>",
				function()
					Snacks.terminal()
				end,
				desc = "Toggle Terminal",
			},
			{
				"<c-_>",
				function()
					Snacks.terminal()
				end,
				desc = "which_key_ignore",
			},
			{
				"]]",
				function()
					Snacks.words.jump(vim.v.count1)
				end,
				desc = "Next Reference",
				mode = { "n", "t" },
			},
			{
				"[[",
				function()
					Snacks.words.jump(-vim.v.count1)
				end,
				desc = "Prev Reference",
				mode = { "n", "t" },
			},
		},
	},

	-- trouble
	{
		"folke/trouble.nvim",
		tag = "v3.7.1",
		opts = { use_diagnostic_signs = true },
	},

	-- vim-be-good
	{
		"ThePrimeagen/vim-be-good",
	},

	-- web-devicons
	{
		"nvim-tree/nvim-web-devicons",
		opts = {},
	},
}
