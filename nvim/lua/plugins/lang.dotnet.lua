return {

	-- nvim-dap
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			-- dap.setup()
			ui.setup()

			-- Keymaps for controlling the debugger
			vim.keymap.set("n", "q", function()
				dap.terminate()
				dap.clear_breakpoints()
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
		end,
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
				diagnostics = {
					default_severity = "error",
					setqflist = false,
				},
				server = {
					---@type nil | "Off" | "Critical" | "Error" | "Warning" | "Information" | "Verbose" | "All"
					log_level = "All",
				},
				test_runner = {
					---@type "split" | "float" | "buf"
					-- viewmode = "float",
					viewmode = "float",
					enable_buffer_test_execution = true, --Experimental, run tests directly from buffer
					noBuild = true,
					noRestore = true,
					mappings = {
						run_test_from_buffer = { lhs = "<leader>r", desc = "run test from buffer" },
						filter_failed_tests = { lhs = "<leader>fe", desc = "filter failed tests" },
						debug_test = { lhs = "<leader>d", desc = "debug test" },
						go_to_file = { lhs = "g", desc = "got to file" },
						run_all = { lhs = "<leader>R", desc = "run all tests" },
						run = { lhs = "<leader>r", desc = "run test" },
						peek_stacktrace = { lhs = "<leader>p", desc = "peek stacktrace of failed test" },
						expand = { lhs = "o", desc = "expand" },
						expand_node = { lhs = "E", desc = "expand node" },
						expand_all = { lhs = "-", desc = "expand all" },
						collapse_all = { lhs = "W", desc = "collapse all" },
						close = { lhs = "q", desc = "close testrunner" },
						refresh_testrunner = { lhs = "<C-r>", desc = "refresh testrunner" },
					},
					--- Optional table of extra args e.g "--blame crash"
					additional_args = {},
				},
			})
		end,
	},
}
