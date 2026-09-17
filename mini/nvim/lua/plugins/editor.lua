return {

	-- blink.cmp
	{
		"saghen/blink.cmp",
		version = "*",
	},

	-- bufferline
	{
		"akinsho/bufferline.nvim",
		version = "*",
		opts = {
			-- stylua: ignore
			options = {
				always_show_bufferline = true,
				diagnostics = "nvim_lsp",
				max_name_length = 40,								-- Longer max length, so we can still see longer file names.
				name_formatter = function(buf)
					return string.format("  %s  ", buf.name)		-- Some margin around the tab name
				end,
			},
		},
	},

	-- lualine.nvim
	-- Status line at the bottom.
	-- https://github.com/nvim-lualine/lualine.nvim
	{
		"nvim-lualine/lualine.nvim",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			options = {
				theme = "iceberg_dark",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		},
	},

	-- trouble
	{
		"folke/trouble.nvim",
		version = "*",
		opts = { use_diagnostic_signs = true },
	},

	-- web-devicons
	{
		"nvim-tree/nvim-web-devicons",
		branch = "master",
		opts = {},
	},
}
