return {

	{
		"mistweaverco/kulala.nvim",
		keys = {
			{ "<leader>Rs", desc = "Send request" },
			{ "<leader>Ra", desc = "Send all requests" },
			{ "<leader>Rb", desc = "Open scratchpad" },
		},
		ft = { "http", "rest" },
		opts = {
			global_keymaps = true,
			global_keymaps_prefix = "<leader>R",
			kulala_keymaps_prefix = "",

			-- kulala_keymaps = {
			--   ["Show headers"] = { "H", function() require("kulala.ui").show_headers() end, },
			-- }
			kulala_keymaps = {
				["Show verbose"] = false, -- set false to disable
			},

			ui = {

				-- Current available pane contains { "body", "headers", "headers_body", "script_output", "stats", "verbose", "report", "help" },
				default_winbar_panes = {
					"body",
					"headers",
					"headers_body",
					"verbose",
					"script_output",
					"report",
					"help",
				},

				-- enable/disable request summary in the output window
				show_request_summary = false,

				-- report = {
				-- 	-- possible values: true | false | "on_error"
				-- 	show_script_output = true,
				-- 	-- possible values: true | false | "on_error" | "failed_only"
				-- 	show_asserts_output = true,
				-- 	-- possible values: true | false | "on_error"
				-- 	show_summary = true,
				--
				-- 	headersHighlight = "Special",
				-- 	successHighlight = "String",
				-- 	errorHighlight = "Error",
				-- },

				split_direction = "horizontal",
			},
		},
	},
}
