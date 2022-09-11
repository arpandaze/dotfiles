require("catppuccin").setup({
	transparent_background = false,
	compile = { enabled = true },
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	integrations = {
		dashboard = true,
		cmp = true,
		dap = {
			enabled = true,
			enable_ui = true,
		},
		fidget = true,
		gitsigns = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		leap = true,
		lsp_trouble = true,
		markdown = true,
		navic = {
			enabled = true,
			custom_bg = "NONE",
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		notify = true,
		nvimtree = true,
		symbols_outline = true,
		telescope = true,
		treesitter = true,
		which_key = true,
	},
})
vim.g.catppuccin_flavour = "mocha"
vim.cmd([[colorscheme catppuccin]])
