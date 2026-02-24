return {

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
			})
		end,
	},
}
