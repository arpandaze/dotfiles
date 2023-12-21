return {
	"wbthomason/packer.nvim",
	"nvim-lua/plenary.nvim",
	"lewis6991/impatient.nvim",

	-- Autopair
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({ enable_check_bracket_line = false })
		end,
	},

	-- Theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("daze.config.catppuccin")
		end,
	},

	-- Dashboard
	{
		"glepnir/dashboard-nvim",
		config = function()
			require("daze.config.dashboard")
		end,
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.x",
		config = function()
			require("daze.config.telescope")
		end,
	},

	-- Harpoon for nagivation
	"ThePrimeagen/harpoon",

	-- Indentation guides
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("daze.config.indent-blankline")
		end,
	},

	"arkav/lualine-lsp-progress",

	-- Top buffer line
	{
		"akinsho/bufferline.nvim",
		version = "v4.*",
		config = function()
			require("bufferline").setup({
				options = {
					offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
				},
				highlights = require("catppuccin.groups.integrations.bufferline").get(),
			})
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	},

	{
		"stevearc/conform.nvim",
		config = function()
			require("daze.config.conform")
		end,
	},

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			-- { "jose-elias-alvarez/null-ls.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-cmdline" },
			{ "zbirenbaum/copilot-cmp" }, -- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
		config = function()
			require("daze.config.lsp-zero")
			require("daze.config.copilot")
		end,
	},

	-- Github Copilot
	"zbirenbaum/copilot.lua",

	-- Commenting
	{
		"numToStr/Comment.nvim",
		config = function()
			require("daze.config.comment")
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	-- Hardtime
	{
		"m4xshen/hardtime.nvim",
		config = function()
			require("hardtime").setup()
		end,
	},

	-- Status Line Related
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("daze.config.lualine")
		end,
	},

	-- Treesitter for highlighting
	{
		"nvim-treesitter/nvim-treesitter",
        config = "f2778bd1a28b74adf5b1aa51aa57da85adfa3d16",
		build = ":TSUpdate",
		config = function()
			require("daze.config.nvim-treesitter")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup()
		end,
	},

	-- Visual surround
	{
		"kylechui/nvim-surround",
		version = "*",
		config = function()
			require("nvim-surround").setup({ keymaps = { visual = "A" } })
		end,
	},

	-- Motion
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	},

	{
		"ggandor/flit.nvim",
		config = function()
			require("flit").setup({
				keys = { f = "f", F = "F", t = "t", T = "T" },
				-- A string like "nv", "nvo", "o", etc.
				labeled_modes = "v",
				multiline = true,
				-- Like `leap`s similar argument (call-specific overrides).
				-- E.g.: opts = { equivalence_classes = {} }
				lazy = {},
			})
		end,
	},

	-- Repeat
	{
		"tpope/vim-repeat",
		config = function()
			require("leap").add_default_mappings()
		end,
	},

	-- Git Plugin
	{ "tpope/vim-fugitive" },

	{ "ron-rs/ron.vim" },

	{ "stevearc/dressing.nvim" },

	-- Dart & Flutter Plugin
	-- use {
	--     'akinsho/flutter-tools.nvim',
	--     config = function() require("daze.config.flutter-tools") end
	-- }

	{ "tikhomirov/vim-glsl" },

	{
		"karb94/neoscroll.nvim",
		config = function()
			require("daze.config.neoscroll")
		end,
	},
}
