return {
	"seblyng/roslyn.nvim",
	lazy = false,
	ft = "cs",
	opts = {
		config = {
			settings = {
				["csharp|background_analysis"] = {
					dotnet_analyzer_diagnostics_scope = "fullSolution",
					dotnet_compiler_diagnostics_scope = "fullSolution"
				},
				["csharp|completion"] = {
					dotnet_provide_regex_completions = false,
					dotnet_show_completion_items_from_unimported_namespaces = true,
					dotnet_show_name_completion_suggestions = false,
				},
				["csharp|formatting"] = {
					dotnet_organize_imports_on_format = true,
				},
				["csharp|inlay_hints"] = {
					csharp_enable_inlay_hints_for_implicit_object_creation = false,
					csharp_enable_inlay_hints_for_implicit_variable_types = true,
					csharp_enable_inlay_hints_for_lambda_parameter_types = false,
					csharp_enable_inlay_hints_for_types = false,
					dotnet_enable_inlay_hints_for_indexer_parameters = false,
					dotnet_enable_inlay_hints_for_literal_parameters = true,
					dotnet_enable_inlay_hints_for_object_creation_parameters = false,
					dotnet_enable_inlay_hints_for_other_parameters = false,
					dotnet_enable_inlay_hints_for_parameters = false,
					dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = false,
					dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = false,
					dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = false,
				},
			}
		}
	},
	config = function()
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				local cwd = vim.fn.getcwd()
				local has_sln = vim.fn.globpath(cwd, "*.sln") ~= ""
				local has_csproj = vim.fn.globpath(cwd, "*.csproj") ~= ""
				if has_sln or has_csproj then
					print("VIM ENTER")
				end
			end,
		})
	end,
}
