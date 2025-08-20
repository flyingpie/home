return {
	"neovim/nvim-lspconfig",
	lazy = false,
	opts = {
		servers = {
			-- ["helm-ls"] = {
			-- 	logLevel = "info",
			-- 	valuesFiles = {
			-- 		mainValuesFile = "values.yaml",
			-- 		lintOverlayValuesFile = "values.lint.yaml",
			-- 		additionalValuesFilesGlobPattern = "values*.yaml",
			-- 	},
			-- 	helmLint = {
			-- 		enabled = true,
			-- 		ignoredMessages = {},
			-- 	},
			-- 	yamlls = {
			-- 		enabled = true,
			-- 		enabledForFilesGlob = "*.{yaml,yml}",
			-- 		diagnosticsLimit = 50,
			-- 		showDiagnosticsDirectly = false,
			-- 		path = "yaml-language-server",
			-- 		initTimeoutSeconds = 3,
			-- 		config = {
			-- 			schemas = {
			-- 				kubernetes = "templates/**",
			-- 			},
			-- 			completion = true,
			-- 			hover = true,
			-- 			-- any other config from https://github.com/redhat-developer/yaml-language-server#language-server-settings
			-- 		},
			-- 	},
			-- },
			yamlls = {
				settings = {
					yaml = {
						keyOrdering = false,
						format = {
							enable = true,
						},
						validate = true,
						schemaStore = {
							enable = false, -- disable built-in schema store to use custom
						},
						schemas = {
							kubernetes = "k8s-*.yaml",
							["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
							["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
							["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/**/*.{yml,yaml}",
							["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
							["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
							["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
							["http://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}",
						},
					},
				},
			},
		},
	},
}
