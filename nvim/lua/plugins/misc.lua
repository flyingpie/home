return {

	-- Disabled
	{ "MeanderingProgrammer/render-markdown.nvim", enabled = false },
	{ "echasnovski/mini.pairs", enabled = false },
	{ "nvim-neo-tree/neo-tree.nvim", enabled = false },

	{
		"akinsho/bufferline.nvim",
		init = function()
			local bufline = require("catppuccin.groups.integrations.bufferline")
			function bufline.get()
				return bufline.get_theme()
			end
		end,
	},

	-- LazyVim
	{
		"LazyVim/LazyVim",
		opts = {
			-- colorscheme = "tokyonight-night",
			colorscheme = "catppuccin-mocha",
			-- colorscheme = "vscode",
		},
	},

	-- Minimap
	---@module "neominimap.config.meta"
	{
		"Isrothy/neominimap.nvim",
		version = "^3.0.0",
		lazy = false, -- NOTE: NO NEED to Lazy load
		-- Optional. You can alse set your own keybindings
		keys = {
			-- Global Minimap Controls
			{ "<leader>mm", "<cmd>Neominimap Toggle<cr>", desc = "Toggle global minimap" },
			{ "<leader>no", "<cmd>Neominimap Enable<cr>", desc = "Enable global minimap" },
			{ "<leader>nc", "<cmd>Neominimap Disable<cr>", desc = "Disable global minimap" },
			{ "<leader>nr", "<cmd>Neominimap Refresh<cr>", desc = "Refresh global minimap" },

			-- Window-Specific Minimap Controls
			{ "<leader>nwt", "<cmd>Neominimap WinToggle<cr>", desc = "Toggle minimap for current window" },
			{ "<leader>nwr", "<cmd>Neominimap WinRefresh<cr>", desc = "Refresh minimap for current window" },
			{ "<leader>nwo", "<cmd>Neominimap WinEnable<cr>", desc = "Enable minimap for current window" },
			{ "<leader>nwc", "<cmd>Neominimap WinDisable<cr>", desc = "Disable minimap for current window" },

			-- Tab-Specific Minimap Controls
			{ "<leader>ntt", "<cmd>Neominimap TabToggle<cr>", desc = "Toggle minimap for current tab" },
			{ "<leader>ntr", "<cmd>Neominimap TabRefresh<cr>", desc = "Refresh minimap for current tab" },
			{ "<leader>nto", "<cmd>Neominimap TabEnable<cr>", desc = "Enable minimap for current tab" },
			{ "<leader>ntc", "<cmd>Neominimap TabDisable<cr>", desc = "Disable minimap for current tab" },

			-- Buffer-Specific Minimap Controls
			{ "<leader>nbt", "<cmd>Neominimap BufToggle<cr>", desc = "Toggle minimap for current buffer" },
			{ "<leader>nbr", "<cmd>Neominimap BufRefresh<cr>", desc = "Refresh minimap for current buffer" },
			{ "<leader>nbo", "<cmd>Neominimap BufEnable<cr>", desc = "Enable minimap for current buffer" },
			{ "<leader>nbc", "<cmd>Neominimap BufDisable<cr>", desc = "Disable minimap for current buffer" },

			---Focus Controls
			{ "<leader>nf", "<cmd>Neominimap Focus<cr>", desc = "Focus on minimap" },
			{ "<leader>nu", "<cmd>Neominimap Unfocus<cr>", desc = "Unfocus minimap" },
			{ "<leader>ns", "<cmd>Neominimap ToggleFocus<cr>", desc = "Switch focus on minimap" },
		},
		init = function()
			-- The following options are recommended when layout == "float"
			vim.opt.wrap = false
			vim.opt.sidescrolloff = 36 -- Set a large value

			--- Put your configuration here
			---@type Neominimap.UserConfig
			vim.g.neominimap = {
				auto_enable = true,
			}
		end,
	},

	-- NVim Web Dev Icons
	{
		"nvim-tree/nvim-web-devicons",
		opts = {},
	},

	-- Obsidian
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			ui = {
				enable = false,
			},
			workspaces = {
				{
					name = "notes",
					path = "~/syncthing/main/notes",
				},
			},
		},
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Trouble
	{
		"folke/trouble.nvim",
		tag = "v3.7.1",
		opts = { use_diagnostic_signs = true },
	},

	-- Vim Be Good
	{
		"ThePrimeagen/vim-be-good",
	},
}
