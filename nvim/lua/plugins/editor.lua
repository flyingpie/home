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

	-- codediff
	{
		"esmuellert/codediff.nvim",
		cmd = "CodeDiff",
		opts = {
			-- Highlight configuration
			highlights = {
				-- Line-level: accepts highlight group names or hex colors (e.g., "#2ea043")
				line_insert = "DiffAdd", -- Line-level insertions
				line_delete = "DiffDelete", -- Line-level deletions

				-- Character-level: accepts highlight group names or hex colors
				-- If specified, these override char_brightness calculation
				char_insert = nil, -- Character-level insertions (nil = auto-derive)
				char_delete = nil, -- Character-level deletions (nil = auto-derive)

				-- Brightness multiplier (only used when char_insert/char_delete are nil)
				-- nil = auto-detect based on background (1.4 for dark, 0.92 for light)
				char_brightness = nil, -- Auto-adjust based on your colorscheme

				-- Conflict sign highlights (for merge conflict views)
				-- Accepts highlight group names or hex colors (e.g., "#f0883e")
				-- nil = use default fallback chain
				conflict_sign = nil, -- Unresolved: DiagnosticSignWarn -> #f0883e
				conflict_sign_resolved = nil, -- Resolved: Comment -> #6e7681
				conflict_sign_accepted = nil, -- Accepted: GitSignsAdd -> DiagnosticSignOk -> #3fb950
				conflict_sign_rejected = nil, -- Rejected: GitSignsDelete -> DiagnosticSignError -> #f85149
			},

			-- Diff view behavior
			diff = {
				layout = "side-by-side", -- Diff layout: "side-by-side" (two panes) or "inline" (single pane with virtual lines)
				disable_inlay_hints = true, -- Disable inlay hints in diff windows for cleaner view
				max_computation_time_ms = 5000, -- Maximum time for diff computation (VSCode default)
				ignore_trim_whitespace = false, -- Ignore leading/trailing whitespace changes (like diffopt+=iwhite)
				hide_merge_artifacts = false, -- Hide merge tool temp files (*.orig, *.BACKUP.*, *.BASE.*, *.LOCAL.*, *.REMOTE.*)
				original_position = "left", -- Position of original (old) content: "left" or "right"
				conflict_ours_position = "right", -- Position of ours (:2) in conflict view: "left" or "right"
				conflict_result_position = "bottom", -- "bottom" (default): result below diff panes or "center": result between diff panes (three columns)
				conflict_result_height = 30, -- Height of result pane in bottom layout (% of total height)
				conflict_result_width_ratio = { 1, 1, 1 }, -- Width ratio for center layout panes {left, center, right} (e.g., {1, 2, 1} for wider result)
				cycle_next_hunk = true, -- Wrap around when navigating hunks (]c/[c): false to stop at first/last
				cycle_next_file = true, -- Wrap around when navigating files (]f/[f): false to stop at first/last
				cycle_hunks_across_files = false, -- ]c/[c at file boundary hops to first/last hunk of next/prev file (explorer/history)
				jump_to_first_change = true, -- Auto-scroll to first change when opening a diff: false to stay at same line
				highlight_priority = 100, -- Priority for line-level diff highlights (increase to override LSP highlights)
				compute_moves = false, -- Detect moved code blocks (opt-in, matches VSCode experimental.showMoves)
				compact_context_lines = 3, -- Number of context lines around hunks in compact mode
				compact_sync_folds = true, -- Sync fold open/close across panes (mirrors Vim diff mode behavior)
			},

			-- Explorer panel configuration
			explorer = {
				position = "left", -- "left" or "bottom"
				hidden = false, -- Initial visibility state
				width = 60, -- Width when position is "left" (columns)
				height = 15, -- Height when position is "bottom" (lines)
				auto_refresh = true, -- Auto-refresh file list on focus / git index changes (set false to avoid lag in huge repos; R still refreshes manually)
				indent_markers = true, -- Show indent markers in tree view (│, ├, └)
				initial_focus = "explorer", -- Initial focus: "explorer", "original", or "modified"
				icons = {
					folder_closed = "", -- Nerd Font folder icon (customize as needed)
					folder_open = "", -- Nerd Font folder-open icon
				},
				view_mode = "tree", -- "list" or "tree"
				flatten_dirs = true, -- Flatten single-child directory chains in tree view
				file_filter = {
					ignore = { ".git/**", ".jj/**" }, -- Glob patterns to hide (e.g., {"*.lock", "dist/*"})
				},
				focus_on_select = false, -- Jump to modified pane after selecting a file (default: stay in explorer)
				auto_open_on_cursor = false, -- Rebind j/k/Down/Up in the explorer to also open the file under the cursor
				status_right_margin = 1, -- Trailing cells between status symbol (M/A/D) and right edge; increase if Nerd Font icons clip it
				visible_groups = { -- Which groups to show (can be toggled at runtime)
					staged = true,
					unstaged = true,
					conflicts = true,
				},
			},

			-- History panel configuration (for :CodeDiff history)
			history = {
				position = "bottom", -- "left" or "bottom" (default: bottom)
				width = 40, -- Width when position is "left" (columns)
				height = 15, -- Height when position is "bottom" (lines)
				initial_focus = "history", -- Initial focus: "history", "original", or "modified"
				view_mode = "list", -- "list" or "tree" for files under commits
			},

			-- Keymaps in diff view
			keymaps = {
				view = {
					quit = "q", -- Close diff tab
					-- toggle_explorer = "<leader>b", -- Toggle explorer visibility (explorer mode only)
					-- focus_explorer = "<leader>e", -- Focus explorer panel (explorer mode only)
					next_hunk = "]c", -- Jump to next change
					prev_hunk = "[c", -- Jump to previous change
					next_file = "]f", -- Next file in explorer/history mode
					prev_file = "[f", -- Previous file in explorer/history mode
					diff_get = "do", -- Get change from other buffer (like vimdiff)
					diff_put = "dp", -- Put change to other buffer (like vimdiff)
					open_in_prev_tab = "gf", -- Open current buffer in previous tab (or create one before)
					close_on_open_in_prev_tab = false, -- Close codediff tab after gf opens file in previous tab
					toggle_stage = "s", -- Stage/unstage current file (works in explorer and diff buffers)
					stage_hunk = "<leader>hs", -- Stage hunk under cursor to git index
					unstage_hunk = "<leader>hu", -- Unstage hunk under cursor from git index
					discard_hunk = "<leader>hr", -- Discard hunk under cursor (working tree only)
					hunk_textobject = "ih", -- Textobject for hunk (vih to select, yih to yank, etc.)
					show_help = "g?", -- Show floating window with available keymaps
					align_move = "gm", -- Temporarily align moved code blocks across panes
					toggle_layout = "t", -- Toggle between side-by-side and inline layout
					toggle_compact = "gc", -- Toggle compact mode (fold unchanged regions)
				},
				explorer = {
					select = "<CR>", -- Open diff for selected file
					-- hover = "K", -- Show file diff preview
					refresh = "R", -- Refresh git status
					toggle_view_mode = "i", -- Toggle between 'list' and 'tree' views
					stage_all = "S", -- Stage all files
					unstage_all = "U", -- Unstage all files
					restore = "d", -- Discard changes (restore file)
					-- toggle_changes = "gu", -- Toggle Changes (unstaged) group visibility
					-- toggle_staged = "gs", -- Toggle Staged Changes group visibility
					-- Fold keymaps (Vim-style)
					-- fold_open = "zo", -- Open fold (expand current node)
					-- fold_open_recursive = "zO", -- Open fold recursively (expand all descendants)
					-- fold_close = "zc", -- Close fold (collapse current node)
					-- fold_close_recursive = "zC", -- Close fold recursively (collapse all descendants)
					fold_toggle = "o", -- Toggle fold (expand/collapse current node)
					fold_toggle_recursive = "O", -- Toggle fold recursively
					-- fold_open_all = "zR", -- Open all folds in tree
					fold_close_all = "Z", -- Close all folds in tree
				},
				history = {
					select = "<CR>", -- Select commit/file or toggle expand
					toggle_view_mode = "i", -- Toggle between 'list' and 'tree' views
					refresh = "R", -- Refresh history (re-fetch commits)
					-- Fold keymaps (Vim-style, apply to directory nodes only)
					fold_open = "zo", -- Open fold (expand current node)
					fold_open_recursive = "zO", -- Open fold recursively (expand all descendants)
					fold_close = "zc", -- Close fold (collapse current node)
					fold_close_recursive = "zC", -- Close fold recursively (collapse all descendants)
					fold_toggle = "za", -- Toggle fold (expand/collapse current node)
					fold_toggle_recursive = "zA", -- Toggle fold recursively
					fold_open_all = "zR", -- Open all folds in tree
					fold_close_all = "zM", -- Close all folds in tree
				},
				conflict = {
					accept_incoming = "<leader>ct", -- Accept incoming (theirs/left) change
					accept_current = "<leader>co", -- Accept current (ours/right) change
					accept_both = "<leader>cb", -- Accept both changes (incoming first)
					discard = "<leader>cx", -- Discard both, keep base
					-- Accept all (whole file) - uppercase versions
					accept_all_incoming = "<leader>cT", -- Accept ALL incoming changes
					accept_all_current = "<leader>cO", -- Accept ALL current changes
					accept_all_both = "<leader>cB", -- Accept ALL both changes
					discard_all = "<leader>cX", -- Discard ALL, reset to base
					next_conflict = "]x", -- Jump to next conflict
					prev_conflict = "[x", -- Jump to previous conflict
					diffget_incoming = "2do", -- Get hunk from incoming (left/theirs) buffer
					diffget_current = "3do", -- Get hunk from current (right/ours) buffer
				},
			},
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

			local mini_test = require("mini.test")
			mini_test.setup({
				collect = {
					emulated_busted = true,
				},
			})
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
