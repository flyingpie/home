return {

	-- markdown
	{
		"MeanderingProgrammer/render-markdown.nvim",
		version = "*",
		opts = {
			code = { -- Makes code blocks stay put when moving the cursor over them, and when switching modes.
				border = "none",
				conceal_delimiters = false,
			},
		},
	},
}
