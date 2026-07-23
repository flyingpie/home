return {

	{
		dir = "~/workspace/flyingpie/nsql.nvim", -- Local version
	},

	{
		"xemptuous/sqlua.nvim",
		branch = "master",
		lazy = true,
		cmd = "SQLua",
		config = function()
			require("sqlua").setup({
				-- the parent folder that databases will be placed, holding
				-- various tmp files and other saved queries.
				db_save_location = "~/.local/share/nvim/sqlua/",
				-- where to save the json config containing connection information
				connections_save_location = "~/.local/share/nvim/sqlua/connections.json",
				-- the default limit attached to queries
				-- currently only works on "Data" command under a table
				default_limit = 200,
				-- whether to introspect the database on SQLua open or when first expanded
				-- through the sidebar
				load_connections_on_start = false,
				keybinds = {
					execute_query = "<leader>r",
					activate_db = "<C-a>",

					-- Execute query (just like keybinds.execute_query) while in insert mode for query
					insert_execute_query = "<C-r>",
				},
			})
		end,
	},

	--
	-- {
	-- 	"kristijanhusak/vim-dadbod-ui",
	-- 	branch = "master",
	-- 	dependencies = {
	-- 		{ "tpope/vim-dadbod", lazy = true },
	-- 		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql", "duckdb" }, lazy = true }, -- Optional
	-- 	},
	-- 	cmd = {
	-- 		"DBUI",
	-- 		"DBUIToggle",
	-- 		"DBUIAddConnection",
	-- 		"DBUIFindBuffer",
	-- 	},
	-- 	init = function()
	-- 		-- Your DBUI configuration
	-- 		vim.g.db_ui_use_nerd_fonts = 1
	--
	-- 		vim.g.dbs = {
	-- 			{ name = "dev", url = "postgres://postgres:mypassword@localhost:5432/my-dev-db" },
	-- 			{ name = "staging", url = "postgres://postgres:mypassword@localhost:5432/my-staging-db" },
	-- 			{ name = "duck1", url = "duckdb:local.db" },
	-- 			{ name = "duck2", url = "duckdb:~/Downloads/duck.db" },
	-- 			-- {
	-- 			-- 	name = "production",
	-- 			-- 	url = function()
	-- 			-- 		return vim.fn.system("get-prod-url")
	-- 			-- 	end,
	-- 			-- },
	-- 		}
	-- 	end,
	-- 	config = function()
	-- 		vim.keymap.set("n", "<leader>D", ":DBUI<CR>", { noremap = true, silent = true })
	-- 	end,
	-- },

	-- {
	-- 	"kndndrj/nvim-dbee",
	-- 	branch = "master",
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 	},
	-- 	build = function()
	-- 		require("dbee").install()
	-- 	end,
	-- 	config = function()
	-- 		require("dbee").setup(--[[optional config]])
	-- 	end,
	-- },
}
