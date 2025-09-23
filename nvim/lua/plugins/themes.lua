return {

	-- Astro
	{
		"AstroNvim/astrotheme",
		event = "User LoadColorSchemes",
		opts = {
			palette = "astrodark",
			plugins = { ["dashboard-nvim"] = true },
		},
	},

	-- Catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},

	-- Tokyonight
	{
		"folke/tokyonight.nvim",
		event = "User LoadColorSchemes",
		opts = {
			dim_inactive = false,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
			},
		},
	},

	-- VSCode
	{
		{
			"Mofiqul/vscode.nvim",
			opts = {
				color_overrides = {
					vscCursorDarkDark = "#000000",
				},
				transparent = true,
			},
		},
	},
}
