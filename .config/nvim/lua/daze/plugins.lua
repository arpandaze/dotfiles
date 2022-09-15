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

	-- LSP Related Stuffs
	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})
	use({
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				require("mason-lspconfig").setup_handlers({
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,
				}),
				-- Reference: https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
				ensure_installed = { "sumneko_lua", "rust_analyzer", "pyright", "clang", "tsserver" },
			})
			vim.diagnostic.config({
				virtual_text = false,
			})
		end,
	})
	use("neovim/nvim-lspconfig")
	use("arkav/lualine-lsp-progress")

	-- Formatting
	use("sbdchd/neoformat")

	-- use({
	-- 	"jose-elias-alvarez/null-ls.nvim",
	-- 	config = function()
	-- 		require("daze.config.null-ls")
	-- 	end,
	-- })

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

	-- Completion Related Stuffs
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/nvim-cmp")

	-- Commenting
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("daze.config.comment")
		end,
	})

	-- Snippet Related Stuffs
	use({
		"L3MON4D3/LuaSnip",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })
		end,
	})
	use("rafamadriz/friendly-snippets")

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

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
