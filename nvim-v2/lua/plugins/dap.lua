return {

	-- nvim-dap
	{
		"mfussenegger/nvim-dap",
		version = "*",
		-- stylua: ignore
		config = function()
			local dap = require("dap")

			vim.keymap.set("n", "q",			function() dap.terminate(); dap.clear_breakpoints() end,		{ desc = "Terminate and clear breakpoints" })
			vim.keymap.set("n", "<F5>",			dap.continue,													{ desc = "Start/continue debugging" })
			vim.keymap.set("n", "<F10>",		dap.step_over,													{ desc = "Step over" })
			vim.keymap.set("n", "<F11>",		dap.step_into,													{ desc = "Step into" })
			vim.keymap.set("n", "<F12>", 		dap.step_out,													{ desc = "Step out" })
			vim.keymap.set("n", "<leader>b",	dap.toggle_breakpoint,											{ desc = "Toggle breakpoint" })
			vim.keymap.set("n", "<leader>dO",	dap.step_over,													{ desc = "Step over (alt)" })
			vim.keymap.set("n", "<leader>dC", 	dap.run_to_cursor,												{ desc = "Run to cursor" })
			vim.keymap.set("n", "<leader>dr", 	dap.repl.toggle,												{ desc = "Toggle DAP REPL" })
			vim.keymap.set("n", "<leader>dj", 	dap.down,														{ desc = "Go down stack frame" })
			vim.keymap.set("n", "<leader>dk", 	dap.up,															{ desc = "Go up stack frame" })
		end,
	},

	-- nvim-dap-ui
	{
		"rcarriga/nvim-dap-ui",
		version = "*",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		init = function()
			require("dapui").setup({
				controls = {
					element = "repl",
					enabled = true,
					icons = {
						disconnect = "",
						pause = "",
						play = "",
						run_last = "",
						step_back = "",
						step_into = "",
						step_out = "",
						step_over = "",
						terminate = "",
					},
				},
				element_mappings = {},
				expand_lines = true,
				floating = {
					border = "single",
					mappings = {
						close = { "q", "<Esc>" },
					},
				},
				force_buffers = true,
				icons = { collapsed = "", current_frame = "", expanded = "" },
				layouts = {
					{
						elements = {
							{ id = "scopes", size = 0.75 },
							{ id = "stacks", size = 0.25 },
						},
						position = "left",
						size = 60,
					},
					{
						elements = {
							{ id = "repl", size = 0.5 },
							{ id = "watches", size = 0.5 },
						},
						position = "bottom",
						size = 14,
					},
				},
				mappings = {
					edit = "e",
					expand = { "<CR>", "<LeftMouse>" },
					open = "o",
					remove = "d",
					repl = "r",
					toggle = "t",
				},
				render = { indent = 1, max_value_lines = 100 },
			})

			local dap, dapui = require("dap"), require("dapui")

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			vim.keymap.set("n", "<leader>do", dapui.toggle, { desc = "Toggle Dap UI" })
		end,
	},
}
