return {

	-- nvim-dap
	{
		"mfussenegger/nvim-dap",
		branch = "master",
		dependencies = {
			"igorlfs/nvim-dap-view",
			"nvim-neotest/nvim-nio",
			-- "rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap = require("dap")
			-- local dapui = require("dapui")
			-- local dapview = require("dap-view")
			local virt = require("nvim-dap-virtual-text")

			-- dapui.setup()
			virt.setup()

			-- dap.listeners.before.attach.dapui_config = function()
			-- 	-- dapui.open()
			-- 	dapview.open()
			-- end
			-- dap.listeners.before.launch.dapui_config = function()
			-- 	-- dapui.open()
			-- 	dapview.open()
			-- end
			-- dap.listeners.before.event_terminated.dapui_config = function()
			-- 	-- dapui.close()
			-- 	dapview.close()
			-- end
			-- dap.listeners.before.event_exited.dapui_config = function()
			-- 	-- dapui.close()
			-- 	dapview.close()
			-- end

			-- Keymaps for controlling the debugger
			vim.keymap.set("n", "q", function()
				dap.terminate()
				-- dap.clear_breakpoints()
			end, { desc = "Terminate and clear breakpoints" })

			vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/continue debugging" })
			vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step over" })
			vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step into" })
			vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step out" })
			vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
			vim.keymap.set("n", "<leader>dO", dap.step_over, { desc = "Step over (alt)" })
			vim.keymap.set("n", "<leader>dC", dap.run_to_cursor, { desc = "Run to cursor" })
			vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "Toggle DAP REPL" })
			vim.keymap.set("n", "<leader>dj", dap.down, { desc = "Go down stack frame" })
			vim.keymap.set("n", "<leader>dk", dap.up, { desc = "Go up stack frame" })

			-- https://github.com/mfussenegger/nvim-dap/issues/1341
			vim.cmd("hi DapBreakpointColor guifg=#fa4848")
			vim.fn.sign_define(
				"DapBreakpoint",
				{ text = "", texthl = "DapBreakpointColor", linehl = "", numhl = "" }
			)
		end,
	},

	-- nvim-dap-view
	{
		"igorlfs/nvim-dap-view",
		---@module 'dap-view'
		---@type dapview.Config
		opts = {
			auto_toggle = true,
			winbar = {
				controls = {
					enabled = true,
				},
				sections = {
					"scopes",
					"watches",
					"exceptions",
					"breakpoints",
					"threads",
					"repl",
				},
				-- default_section = "watches",
			},
		},
	},

	-- easy-dotnet
	{
		"GustavEikaas/easy-dotnet.nvim",
		branch = "main",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local dotnet = require("easy-dotnet")
			dotnet.setup({
				auto_bootstrap_namespace = true,
				csproj_mappings = true,
				picker = "snacks",
				background_scanning = true,

				-- Diagnostics
				diagnostics = {
					default_severity = "error",
					setqflist = false,
				},

				-- LSP
				lsp = {
					enabled = true, -- Enable builtin roslyn lsp
					preload_roslyn = true, -- Start loading roslyn before any buffer is opened
					roslynator_enabled = true, -- Automatically enable roslynator analyzer
					easy_dotnet_analyzer_enabled = true, -- Enable roslyn analyzer from easy-dotnet-server
					auto_refresh_codelens = true,
					analyzer_assemblies = {}, -- Any additional roslyn analyzers you might use like SonarAnalyzer.CSharp
					config = {},
				},

				-- Notifications
				notifications = {
					handler = function(start_event)
						local spinner = require("easy-dotnet.ui-modules.spinner").new()
						spinner:start_spinner(start_event.job.name)
						---@param finished_event JobEvent
						return function(finished_event)
							spinner:stop_spinner(finished_event.result.msg, finished_event.result.level)
						end
					end,
				},

				-- Server
				server = {
					---@type nil | "Off" | "Critical" | "Error" | "Warning" | "Information" | "Verbose" | "All"
					log_level = "All",
				},

				-- Test Runner
				test_runner = {
					viewmode = "vsplit",
					vsplit_width = 60,
					enable_buffer_test_execution = true, --Experimental, run tests directly from buffer
					noBuild = true,
					noRestore = true,
					-- stylua: ignore
					mappings = {
						close					= { lhs = "q",				desc = "close testrunner"					},
						collapse_all			= { lhs = "W",				desc = "collapse all"						},
						debug_test				= { lhs = "<leader>d",		desc = "debug test"							},
						expand					= { lhs = "o",				desc = "expand"								},
						expand_all				= { lhs = "-",				desc = "expand all"							},
						expand_node				= { lhs = "E",				desc = "expand node"						},
						filter_failed_tests		= { lhs = "<leader>fe",		desc = "filter failed tests"				},
						go_to_file				= { lhs = "g",				desc = "got to file"						},
						peek_stacktrace			= { lhs = "<leader>p",		desc = "peek stacktrace of failed test"		},
						refresh_testrunner		= { lhs = "<C-r>",			desc = "refresh testrunner"					},
						run						= { lhs = "<leader>r",		desc = "run test"							},
						run_all					= { lhs = "<leader>R",		desc = "run all tests"						},
						run_test_from_buffer	= { lhs = "<leader>r",		desc = "run test from buffer"				},
					},
					--- Optional table of extra args e.g "--blame crash"
					additional_args = {},
				},
			})
		end,
	},
}
