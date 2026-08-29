return {

	-- image
	{
		"3rd/image.nvim",
		opts = {
			backend = "kitty", -- or "ueberzug" or "sixel"
			processor = "magick_cli", -- or "magick_rock"
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = false,
					only_render_image_at_cursor_mode = "popup", -- or "inline"
					floating_windows = false, -- if true, images will be rendered in floating markdown windows
					filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
				},
				asciidoc = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = false,
					only_render_image_at_cursor_mode = "popup",
					floating_windows = false,
					filetypes = { "asciidoc", "adoc" },
				},
				neorg = {
					enabled = true,
					filetypes = { "norg" },
				},
				rst = {
					enabled = true,
				},
				typst = {
					enabled = true,
					filetypes = { "typst" },
				},
				html = {
					enabled = false,
				},
				css = {
					enabled = false,
				},
			},
			max_width = nil,
			max_height = nil,
			max_width_window_percentage = nil,
			max_height_window_percentage = 50,
			scale_factor = 1.0,
			kitty_direct_chunk_size = 4096, -- chunk size for direct Kitty graphics protocol transmission
			window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
			editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
			tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
			hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
		},
	},

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
	},

	-- obsidian
	{
		"epwalsh/obsidian.nvim",
		version = "*",
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
