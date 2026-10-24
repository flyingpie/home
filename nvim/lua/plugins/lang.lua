return {

	-- mason
	{
		"mason-org/mason.nvim",
		version = "*",
		opts = {
			registries = {
				"github:mason-org/mason-registry",
				"github:Crashdummyy/mason-registry",
			},
			ensure_installed = {
				"bash-language-server",
				"clangd",
				"codelldb",
				"csharpier",
				"css-lsp",
				"editorconfig-checker",
				"eslint-lsp",
				"html-lsp",
				"json-lsp",
				"lua-language-server",
				"powershell-editor-services",
				"prettier",
				"roslyn",
				"stylua",
				"typescript-language-server",
				"xmlformatter",
			},
		},
	},

	-- nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		version = "*",
		init = function()
			----------------------------------------------------------
			-- Align CodeLens text to line indentation.
			-- https://github.com/neovim/neovim/issues/39477#issuecomment-5490683939
			----------------------------------------------------------
			local codelens = vim.lsp.codelens

			-- Provider is private in 0.12, so retrieve it from codelens.get().
			local Provider
			for i = 1, 20 do
				local name, value = debug.getupvalue(codelens.get, i)

				if not name then
					break
				end

				if name == "Provider" then
					Provider = value
					break
				end
			end

			assert(Provider, "Could not find vim.lsp.codelens Provider")

			if not Provider._indent_alignment_patched then
				local original_on_win = Provider.on_win

				Provider.on_win = function(self, toprow, botrow)
					local original_range_lsp = vim.range.lsp

					-- codelens.on_win() uses range.start_col as the amount of
					-- padding before the virtual-line text. Replace that value
					-- with the indentation width of the actual source line.
					vim.range.lsp = function(bufnr, lsp_range, encoding)
						local range = original_range_lsp(bufnr, lsp_range, encoding)

						local row = lsp_range.start.line
						local line = vim.api.nvim_buf_get_lines(bufnr, row, row + 1, false)[1] or ""

						local indent = line:match("^%s*") or ""

						range.start_col = vim.fn.strdisplaywidth(indent)

						return range
					end

					-- Make sure vim.range.lsp is restored even if rendering fails.
					local ok, err = xpcall(function()
						original_on_win(self, toprow, botrow)
					end, debug.traceback)

					vim.range.lsp = original_range_lsp

					if not ok then
						error(err)
					end
				end

				Provider._indent_alignment_patched = true
			end
			----------------------------------------------------------
		end,
	},

	-- obsidian
	{
		"obsidian-nvim/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		opts = {
			legacy_commands = false,
			-- ui = {
			-- 	enable = false,
			-- },
			workspaces = {
				{
					name = "notes",
					path = "~/syncthing/main/notes",
				},
			},
		},
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"c_sharp",
				"cpp",
				"css",
				"gitignore",
				"html",
				"http",
				"ini",
				"java",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"razor",
				"regex",
				"scss",
				"sql",
				"svelte",
				"terraform",
				"typescript",
				"vim",
				"vue",
				"xml",
				"yaml",
				"zig",
			},
		},
	},
}
