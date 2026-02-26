return {

	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "vscode",
		},
	},

	-- VSCode
	{
		"flyingpie/vscode.nvim",
		branch = "custom",
		opts = {
			color_overrides = {
				vscCursorDarkDark = "#101010",
				vscPopupBack = "#090909",
			},
			transparent = true,
		},
	},

	-- -- VSCode - Local
	-- {
	-- 	dir = "~/workspace/github/vscode.nvim",
	-- 	name = "vscode.nvim",
	-- 	opts = {
	-- 		transparent = true,
	-- 	},
	-- },
}
