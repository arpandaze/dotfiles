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
		dependencies = { "catppuccin/nvim" },
		after = "catppuccin",
		config = function()
			require("bufferline").setup({
				highlights = require("catppuccin.special.bufferline").get_theme(),
			})
		end,
	},

	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = {},
	},

	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({
				view = { adaptive_size = true },
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		config = function()
			require("daze.config.conform")
		end,
	},

	-- {
	-- 	"github/copilot.vim",
	-- },

	{
		"mason-org/mason.nvim",
		opts = {},
	},

	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("daze.config.mason-lspconfig")
		end,
	},

	-- Completion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("daze.config.cmp")
		end,
	},
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "L3MON4D3/LuaSnip" },
	{ "rafamadriz/friendly-snippets" },

	-- {
	-- 	"VonHeikemen/lsp-zero.nvim",
	-- 	branch = "v1.x",
	-- 	dependencies = {
	-- 		-- LSP Support
	-- 		{
	-- 			"williamboman/mason.nvim",
	-- 		},
	-- 		{ "neovim/nvim-lspconfig" },
	-- 		{ "williamboman/mason-lspconfig.nvim" },
	--
	-- 		-- Autocompletion
	-- 		{ "hrsh7th/nvim-cmp" },
	-- 		{ "hrsh7th/cmp-nvim-lsp" },
	-- 		{ "hrsh7th/cmp-buffer" },
	-- 		{ "hrsh7th/cmp-path" },
	-- 		{ "saadparwaiz1/cmp_luasnip" },
	-- 		{ "hrsh7th/cmp-nvim-lua" },
	-- 		{ "hrsh7th/cmp-cmdline" },
	-- 		{ "zbirenbaum/copilot-cmp" }, -- Snippets
	-- 		{ "L3MON4D3/LuaSnip" }, -- Required
	-- 		{ "rafamadriz/friendly-snippets" }, -- Optional
	-- 	},
	-- 	config = function()
	-- 		require("daze.config.lsp-zero")
	-- 		require("daze.config.copilot")
	-- 	end,
	-- },

	{
		"rmagatti/auto-session",
		lazy = false,
		config = function()
			require("daze.config.auto-session")
		end,
	},

	-- Commenting
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
		end,
	},

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
		build = ":TSUpdate",
		lazy = false,
		config = function()
			require("daze.config.nvim-treesitter")
		end,
	},

	-- -- Treesitter textobjects (must load after nvim-treesitter)
	-- {
	-- 	"nvim-treesitter/nvim-treesitter-textobjects",
	-- 	dependencies = { "nvim-treesitter/nvim-treesitter" },
	-- 	after = "nvim-treesitter",
	-- },

	-- Widfire
	{
		"sustech-data/wildfire.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("wildfire").setup()
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
		"https://codeberg.org/andyg/leap.nvim",
		config = function()
			require("leap").setup({})
			-- Set up default mappings manually
			vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
			vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
			vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)")
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

	-- { "glacambre/firenvim", build = ":call firenvim#install(0)" },
	{ "subnut/nvim-ghost.nvim" },

	-- Extra text objects functionality
	-- { 'echasnovski/mini.ai', version = '*', config = function() require('mini.ai').setup({}) end },

	-- -- WhichKey
	-- {
	--   "folke/which-key.nvim",
	--   event = "VeryLazy",
	--   opts = {
	--     -- your configuration comes here
	--     -- or leave it empty to use the default settings
	--     -- refer to the configuration section below
	--   },
	--   keys = {
	--     {
	--       "<leader>?",
	--       function()
	--         require("which-key").show({ global = false })
	--       end,
	--       desc = "Buffer Local Keymaps (which-key)",
	--     },
	--   },
	-- },

	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"
		end,
	},

	-- Repeat
	{
		"tpope/vim-repeat",
	},

	{ "ron-rs/ron.vim" },

	{
		"stevearc/dressing.nvim",
		config = function()
			require("daze.config.dressing")
		end,
	},
}
