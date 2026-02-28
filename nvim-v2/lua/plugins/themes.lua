return {

	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "vscode",
		},
	},

	-- VSCode
	{
		"flyingpie/vscode.nvim", -- Remote version
		-- name = "vscode.nvim",
		-- dir = "~/workspace/flyingpie/vscode.nvim", -- Local version
		branch = "custom",
		opts = {
			-- stylua: ignore
			color_overrides = {
				vscCursorDarkDark = "#101010",		-- Selected line background (includes selected file in file browser)
				vscPopupBack = "#090909",			-- Modal background (includes minimap)
				vscWhitespace = "#333355",			-- Whitespace chars, including tabs and spaces
				vscNonText = "#333355",				-- End of lines, LSP inlays, and some other stuff

				vscTabLineFill = "#999999",			-- Tab line background (including between tabs)
				vscTabOutside = "#111111",			-- Tab line background (tabs themselves)
			},
			transparent = true,
		},
	},
}
