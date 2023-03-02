local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "none" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use("lewis6991/impatient.nvim")

	-- Autopair
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				enable_check_bracket_line = false,
			})
		end,
	})

	-- Theme
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require("daze.config.catppuccin")
		end,
	})

	-- Dashboard
	use({
		"glepnir/dashboard-nvim",
		config = function()
			require("daze.config.dashboard")
		end,
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.x",
		config = function()
			require("daze.config.telescope")
		end,
	})

	-- Harpoon for nagivation
	use("ThePrimeagen/harpoon")

	-- Indentation guides
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("daze.config.indent-blankline")
		end,
	})

	use("kyazdani42/nvim-web-devicons")

	use("arkav/lualine-lsp-progress")

	-- Top buffer line
	use({
		"akinsho/bufferline.nvim",
		tag = "v2.*",
		config = function()
			require("bufferline").setup({
				options = {
					offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
				},
				highlights = require("catppuccin.groups.integrations.bufferline").get(),
			})
		end,
	})

	use({
		"kyazdani42/nvim-tree.lua",
		tag = "nightly",
		config = function()
			require("nvim-tree").setup()
		end,
	})

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "jose-elias-alvarez/null-ls.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-cmdline" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
		config = function()
			require("daze.config.lsp-zero")
			require("daze.config.null-ls")
		end,
	})

	-- Commenting
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("daze.config.comment")
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})

	-- Status Line Related
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("daze.config.lualine")
		end,
	})

	-- Treesitter for highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("daze.config.nvim-treesitter")
		end,
	})

	-- Visual surround
	use({
		"kylechui/nvim-surround",
		tag = "*",
		config = function()
			require("nvim-surround").setup()
		end,
	})

	-- Motion
	use({
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()

			-- Disable x and X leap motion
		end,
	})

	use({
		"ggandor/flit.nvim",
		config = function()
			require("flit").setup({
				keys = { f = "f", F = "F", t = "t", T = "T" },
				-- A string like "nv", "nvo", "o", etc.
				labeled_modes = "v",
				multiline = true,
				-- Like `leap`s similar argument (call-specific overrides).
				-- E.g.: opts = { equivalence_classes = {} }
				opts = {},
			})
		end,
	})

	-- Repeat
	use({
		"tpope/vim-repeat",
		config = function()
			require("leap").add_default_mappings()
		end,
	})

	-- Git Plugin
	use({
		"tpope/vim-fugitive",
	})

	use({
		"ron-rs/ron.vim",
	})

	-- Latex Plugin
	use({
		"lervag/vimtex",
		config = function()
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_syntax_enabled = 0
		end,
	})

	use({
		"tikhomirov/vim-glsl",
	})

	use({
		"karb94/neoscroll.nvim",
		config = function()
			require("daze.config.neoscroll")
		end,
	})

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
