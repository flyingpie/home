-- +====================================================+
-- |                                                    |
-- |              C# DEVELOPMENT SETUP                  |
-- |                                                    |
-- +====================================================+

return {
	-- Formatters
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			default_format_opts = {
				lsp_format = "prefer",
			},
			formatters_by_ft = {
				cs = { "dotnet_format" },
			},
			formatters = {
				-- Do not use this.
				dotnet_format = {
					command = "dotnet",
					args = function()
						local csproj_file = vim.fs.find(function(name, _)
							return name:match("(%w+)%.csproj$")
						end, { limit = math.huge, type = "file" })

						local cmd = "format " .. csproj_file[1] .. " --include $FILENAME --no-restore"
						print(cmd)

						return cmd
					end,
					stdin = false,
				},
			},
		},
	},
}
