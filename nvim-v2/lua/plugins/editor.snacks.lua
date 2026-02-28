return {

	-- snacks
	{
		"folke/snacks.nvim",
		---@type snacks.Config
		opts = {
			---@class snacks.dashboard.Config
			dashboard = {
				-- These settings are used by some built-in sections
				preset = {
					-- Used by the `header` section
					header = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣷⢸⣿⣿⡜⢯⣷⡌⡻⣿⣿⣿⣆⢈⠻⠿⢿⣿⣿⣿⣿⣿⣿⣷⣦⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡁⢳⣿⣿⣿⣿⣿⣿⡜⣿⣿⣧⢀⢻⣷⠰⠈⢿⣿⣿⣧⢣⠉⠑⠪⢙⠿⠿⠿⠿⠿⠿⠿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣱⡇⡞⣿⣿⣿⣿⣿⣿⡇⣿⣿⡏⡄⣧⠹⡇⠧⠈⢻⣿⣿⡇⢧⢢⠀⠀⠑⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣇⢃⢿⣿⣿⣿⣿⣿⣷⣿⣿⠇⢃⣡⣤⡹⠐⣿⣀⢻⣿⣿⢸⡎⠳⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣾⣿⣿⠘⡸⣿⣿⣿⣿⣿⣿⣿⡿⣰⣿⣿⢟⡷⠈⠋⠃⠎⢿⣿⡏⣿⠀⠘⢆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⡐⢹⣿⣿⡐⢡⢹⣿⣿⣿⣿⡏⣿⢣⣿⣿⡑⠁⠔⠀⠉⠉⠢⡘⣿⡇⣿⡇⠀⡀⠡⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠘⣿⣿⣇⠇⢣⢻⣿⣿⣿⡇⢇⣾⣿⣿⡆⢸⣤⡀⠚⢂⠀⢡⢿⡇⣿⡇⠀⢿⠀⠀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠠⠹⣿⣿⡘⣆⢣⠻⣿⣿⢈⣾⣿⣿⣿⣶⣸⣏⢀⣬⣋⡼⣠⢸⢹⣿⡇⢠⣼⠙⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡇⠁⠹⣿⣇⠹⡃⠃⠙⡇⠘⢿⣿⣿⣿⣿⣿⣏⣓⣉⣭⣴⣿⠘⢸⣿⠁⠘⠋⠀⠹⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⠀⠀⠈⢿⣇⠂⣷⠄⠐⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢠⢸⡏⠀⢀⣠⣴⣾⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢆⠀⠀⠀⠙⠆⠈⠢⠲⠥⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡞⣸⠁⠀⢸⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠄⠃⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⡏⠹⣿⣿⡿⠫⠊⠀⠀⠀⣶⠀⢻⣿⣿⣿⣿⡿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⠻⠿⠿⠿⢋⠀⠀⠀⠀⢀⣼⣿⡆⠈⣿⣿⣿⡟⣱⡷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢁⣁⡀⠨⣛⠿⠶⠄⢀⣠⣾⣿⣿⣷⠀⢹⣿⡟⣴⠈⢃⣶⠔⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⡄⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠈⣿⣿⡿⠀⡀⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢙⠻⣿⣿⢀⠙⠻⠿⣿⣿⣿⣿⣿⣿⡇⠁⣿⠟⡀⠈⣧⢰⣿⠆⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠿⠴⠮⣥⠻⢧⣤⣄⣀⡉⢩⣭⣍⣃⣀⣩⠎⢀⣼⠉⣼⡯⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⠁⣛⠓⢒⣒⣢⡭⢁⡈⠿⠿⠟⠹⠛⠁⠀⠀⠀⠰⠃⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓
 ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒
▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░
▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ 
▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒
░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░
░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░
   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   
         ░    ░  ░    ░ ░        ░   ░         ░   
                                ░                  
]],
				},
				sections = {
					{ section = "header" },
				},
			},

			picker = {
				sources = {
					explorer = {
						layout = {
							git_status = true,
							git_status_open = false,
							git_untracked = true,

							layout = {
								box = "vertical",
								position = "left",
								width = 50,
								{ win = "input", height = 1, border = "bottom" },
								{ win = "list", border = "none" },
								{ win = "preview", title = "{preview}", height = 0.4, border = "top" },
							},

							preset = "sidebar",
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
			},
		},
		-- stylua: ignore
		keys = {

			-- Top Pickers & Explorer
			{ "<leader><space>",		function() Snacks.picker.smart()											end, desc = "Smart Find Files",			},
			{ "<leader>,",				function() Snacks.picker.buffers()											end, desc = "Buffers",					},
			{ "<leader>/",				function() Snacks.picker.grep()												end, desc = "Grep",						},
			{ "<leader>:",				function() Snacks.picker.command_history()									end, desc = "Command History",			},
			{ "<leader>n",				function() Snacks.picker.notifications()									end, desc = "Notification History",		},
			{ "<leader>e",				function() Snacks.explorer()												end, desc = "File Explorer",			},
			-- find
			{ "<leader>fb",				function() Snacks.picker.buffers()											end, desc = "Buffers",					},
			{ "<leader>fc",				function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") })			end, desc = "Find Config File",			},
			{ "<leader>ff",				function() Snacks.picker.files()											end, desc = "Find Files",				},
			{ "<leader>fp",				function() Snacks.picker.projects()											end, desc = "Projects",					},
			{ "<leader>fr",				function() Snacks.picker.recent()											end, desc = "Recent",					},
			-- git
			{ "<leader>gb",				function() Snacks.picker.git_branches()										end, desc = "Git Branches",				},
			{ "<leader>gl",				function() Snacks.picker.git_log()											end, desc = "Git Log",					},
			{ "<leader>gL",				function() Snacks.picker.git_log_line()										end, desc = "Git Log Line",				},
			{ "<leader>gs",				function() Snacks.picker.git_status()										end, desc = "Git Status",				},
			{ "<leader>gS",				function() Snacks.picker.git_stash()										end, desc = "Git Stash",				},
			{ "<leader>gd",				function() Snacks.picker.git_diff()											end, desc = "Git Diff (Hunks)",			},
			{ "<leader>gf",				function() Snacks.picker.git_log_file()										end, desc = "Git Log File",				},
			-- Grep
			{ "<leader>sb",				function() Snacks.picker.lines()											end, desc = "Buffer Lines",				},
			{ "<leader>sB",				function() Snacks.picker.grep_buffers()										end, desc = "Grep Open Buffers",		},
			{ "<leader>fg",				function() Snacks.picker.grep()												end, desc = "Grep",						},
			{ "<leader>sw",				function() Snacks.picker.grep_word()										end, desc = "Visual selection or word",		mode = { "n", "x" },		},
			-- Search
			{ '<leader>s"',				function() Snacks.picker.registers()										end, desc = "Registers",				},
			{ "<leader>s/",				function() Snacks.picker.search_history()									end, desc = "Search History",			},
			{ "<leader>sa",				function() Snacks.picker.autocmds()											end, desc = "Autocmds",					},
			{ "<leader>sb",				function() Snacks.picker.lines()											end, desc = "Buffer Lines",				},
			{ "<leader>sc",				function() Snacks.picker.command_history()									end, desc = "Command History",			},
			{ "<leader>sC",				function() Snacks.picker.commands()											end, desc = "Commands",					},
			{ "<leader>sd",				function() Snacks.picker.diagnostics()										end, desc = "Diagnostics",				},
			{ "<leader>sD",				function() Snacks.picker.diagnostics_buffer()								end, desc = "Buffer Diagnostics",		},
			{ "<leader>sh",				function() Snacks.picker.help()												end, desc = "Help Pages",				},
			{ "<leader>sH",				function() Snacks.picker.highlights()										end, desc = "Highlights",				},
			{ "<leader>si",				function() Snacks.picker.icons()											end, desc = "Icons",					},
			{ "<leader>sj",				function() Snacks.picker.jumps()											end, desc = "Jumps",					},
			{ "<leader>sk",				function() Snacks.picker.keymaps()											end, desc = "Keymaps",					},
			{ "<leader>sl",				function() Snacks.picker.loclist()											end, desc = "Location List",			},
			{ "<leader>sm",				function() Snacks.picker.marks()											end, desc = "Marks",					},
			{ "<leader>sM",				function() Snacks.picker.man()												end, desc = "Man Pages",				},
			{ "<leader>sp",				function() Snacks.picker.lazy()												end, desc = "Search for Plugin Spec",	},
			{ "<leader>sq",				function() Snacks.picker.qflist()											end, desc = "Quickfix List",			},
			{ "<leader>sR",				function() Snacks.picker.resume()											end, desc = "Resume",					},
			{ "<leader>su",				function() Snacks.picker.undo()												end, desc = "Undo History",				},
			{ "<leader>uC",				function() Snacks.picker.colorschemes()										end, desc = "Colorschemes",				},
			-- LSP
			{ "gd",						function()Snacks.picker.lsp_definitions()									end, desc = "Goto Definition",			},
			{ "gD",						function() Snacks.picker.lsp_declarations()									end, desc = "Goto Declaration",			},
			{ "gr",						function() Snacks.picker.lsp_references()									end, desc = "References",					nowait = true, },
			{ "gI",						function() Snacks.picker.lsp_implementations()								end, desc = "Goto Implementation",		},
			{ "gy",						function() Snacks.picker.lsp_type_definitions()								end, desc = "Goto T[y]pe Definition",	},
			{ "<leader>ss",				function() Snacks.picker.lsp_symbols()										end, desc = "LSP Symbols",				},
			{ "<leader>sS",				function() Snacks.picker.lsp_workspace_symbols()							end, desc = "LSP Workspace Symbols",	},
			-- Other
			{ "<leader>z",				function() Snacks.zen()														end, desc = "Toggle Zen Mode",			},
			{ "<leader>n",				function() Snacks.notifier.show_history()									end, desc = "Notification History",		},
			{ "<leader>bd",				function() Snacks.bufdelete()												end, desc = "Delete Buffer",			},
			{ "<leader>cR",				function() Snacks.rename.rename_file()										end, desc = "Rename File",				},
			{ "<leader>gB",				function() Snacks.gitbrowse()												end, desc = "Git Browse",					mode = { "n", "v" },		},
			{ "<leader>gg",				function() Snacks.lazygit()													end, desc = "Lazygit",					},
			{ "<leader>un",				function() Snacks.notifier.hide()											end, desc = "Dismiss All Notifications",		},
			{ "]]",						function() Snacks.words.jump(vim.v.count1)									end, desc = "Next Reference",				mode = { "n", "t" },		},
			{ "[[",						function() Snacks.words.jump(-vim.v.count1)									end, desc = "Prev Reference",				mode = { "n", "t" },		},
		},
	},
}
