require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"python",
		"c",
		"cpp",
		"rust",
		"lua",
		"javascript",
		"typescript",
		"swift",
		"dart",
		"sql",
		"json",
		"make",
		"markdown",
		"css",
		"html",
	},

	highlight = {
		enable = true,
		use_languagetree = true,
	},

	indent = {
		enable = true,
		disable = { "python", "yaml" },
	},
})
