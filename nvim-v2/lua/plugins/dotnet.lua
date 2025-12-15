return {

	-- {
	-- 	"nvim-neotest/neotest",
	-- 	dependencies = {
	-- 		"lawrence-laz/neotest-zig",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"antoinemadec/FixCursorHold.nvim",
	-- 		-- "nsidorenco/neotest-vstest",
	-- 	},
	-- 	event = "LspAttach",
	-- 	config = function()
	-- 		require("neotest").setup({
	-- 			adapters = {
	-- 				require("neotest-zig")({
	-- 					dap = {
	-- 						adapter = "lldb",
	-- 					},
	-- 				}),
	-- 				require("neotest-vstest"),
	-- 			},
	-- 			log_level = vim.log.levels.TRACE,
	-- 		})
	-- 	end,
	-- },

	-- easy-dotnet
	{
		"GustavEikaas/easy-dotnet.nvim",
		branch = "main",
		dependencies = {
			-- "lawrence-laz/neotest-zig",
			"nvim-lua/plenary.nvim",
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			-- require("neotest").setup({
			-- 	adapters = {
			-- 		require("neotest-vstest"),
			-- 	},
			-- 	log_level = vim.log.levels.TRACE,
			-- })

			local dotnet = require("easy-dotnet")
			-- Options are not required
			dotnet.setup({
				debugger = {
					bin_path = nil, -- Path to custom coreclr DAP adapter, easy-dotnet-server falls back to its own netcoredbg binary if bin_path is nil
					apply_value_converters = true,
					auto_register_dap = true,
					mappings = {
						open_variable_viewer = { lhs = "T", desc = "open variable viewer" },
					},
				},
				---@type TestRunnerOptions
				test_runner = {
					---@type "split" | "vsplit" | "float" | "buf"
					viewmode = "vsplit",
					---@type number|nil
					vsplit_width = 50,
					---@type string|nil "topleft" | "topright"
					vsplit_pos = nil,
					enable_buffer_test_execution = true, -- Experimental, run tests directly from buffer
					noBuild = true,
					icons = {
						passed = "",
						skipped = "",
						failed = "",
						success = "",
						reload = "",
						test = "",
						sln = "󰘐",
						project = "󰘐",
						dir = "",
						package = "",
					},
					-- stylua: ignore
					mappings = {
						refresh_testrunner =				{ lhs = "<C-r>",		desc = "refresh testrunner" },
						close =								{ lhs = "q",			desc = "close testrunner" },
						collapse_all =						{ lhs = "W", 			desc = "collapse all" },

						expand =							{ lhs = "o",			desc = "expand" },
						expand_all =						{ lhs = "-",			desc = "expand all" },
						expand_node =						{ lhs = "E", 			desc = "expand node" },

						run =								{ lhs = "<leader>r",	desc = "run test" },
						run_all =							{ lhs = "<leader>R", 	desc = "run all tests" },
						run_test_from_buffer =				{ lhs = "<leader>r", 	desc = "run test from buffer" },

						debug_test =						{ lhs = "<leader>d",	desc = "debug test" },
						debug_test_from_buffer =			{ lhs = "<leader>db",	desc = "debug test from buffer" },

						filter_failed_tests =				{ lhs = "<leader>fe",	desc = "filter failed tests" },

						go_to_file =						{ lhs = "g",			desc = "go to file" },
						peek_stacktrace =					{ lhs = "<leader>p", 	desc = "peek stacktrace of failed test" },
						peek_stack_trace_from_buffer =		{ lhs = "<leader>p",	desc = "peek stack trace from buffer" },
					},
					--- Optional table of extra args e.g "--blame crash"
					additional_args = {},
				},
				new = {
					project = {
						prefix = "sln", -- "sln" | "none"
					},
				},
				---@param action "test" | "restore" | "build" | "run"
				terminal = function(path, action, args)
					args = args or ""
					local commands = {
						run = function()
							return string.format("dotnet run --project %s %s", path, args)
						end,
						test = function()
							return string.format("dotnet test %s %s", path, args)
						end,
						restore = function()
							return string.format("dotnet restore %s %s", path, args)
						end,
						build = function()
							return string.format("dotnet build %s %s", path, args)
						end,
						watch = function()
							return string.format("dotnet watch --project %s %s", path, args)
						end,
					}
					local command = commands[action]()
					if require("easy-dotnet.extensions").isWindows() == true then
						command = command .. "\r"
					end
					vim.cmd("vsplit")
					vim.cmd("term " .. command)
				end,
				csproj_mappings = true,
				fsproj_mappings = true,
				server = {
					---@type nil | "Off" | "Critical" | "Error" | "Warning" | "Information" | "Verbose" | "All"
					log_level = nil,
				},
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
			})
		end,
	},

	-- -- roslyn
	-- {
	-- 	"seblyng/roslyn.nvim",
	-- 	branch = "main",
	-- 	-- enabled = false,
	-- },

	-- {
	-- 	"seblyng/roslyn.nvim",
	-- 	opts = { autoformat = false },
	-- 	init = function()
	-- 		vim.lsp.config("roslyn", {
	-- 			settings = {
	-- 				["csharp|background_analysis"] = {
	-- 					dotnet_analyzer_diagnostics_scope = "fullSolution",
	-- 					dotnet_compiler_diagnostics_scope = "fullSolution",
	-- 				},
	-- 				["csharp|code_lens"] = {
	-- 					dotnet_enable_references_code_lens = true,
	-- 				},
	-- 				["csharp|inlay_hints"] = {
	-- 					csharp_enable_inlay_hints_for_implicit_object_creation = true,
	-- 					csharp_enable_inlay_hints_for_implicit_variable_types = true,
	--
	-- 					csharp_enable_inlay_hints_for_lambda_parameter_types = true,
	-- 					csharp_enable_inlay_hints_for_types = true,
	-- 					dotnet_enable_inlay_hints_for_indexer_parameters = true,
	-- 					dotnet_enable_inlay_hints_for_literal_parameters = true,
	-- 					dotnet_enable_inlay_hints_for_object_creation_parameters = true,
	-- 					dotnet_enable_inlay_hints_for_other_parameters = true,
	-- 					dotnet_enable_inlay_hints_for_parameters = true,
	-- 					dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
	-- 					dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
	-- 					dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },

	-- -- Roslyn
	-- {
	-- 	"seblyng/roslyn.nvim",
	-- 	---@module 'roslyn.config'
	-- 	---@type RoslynNvimConfig
	-- 	ft = { "cs", "razor" },
	-- 	init = function()
	-- 		vim.lsp.enable("roslyn")
	-- 	end,
	-- 	lazy = false,
	-- 	opts = {
	-- 		broad_search = true,
	-- 		silent = false,
	-- 	},
	-- },
}
