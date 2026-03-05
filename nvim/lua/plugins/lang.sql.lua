return {

	{
		"kndndrj/nvim-dbee",
		branch = "master",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		build = function()
			require("dbee").install("curl")
		end,
		config = function()
			require("dbee").setup(--[[optional config]])
		end,
	},
}
