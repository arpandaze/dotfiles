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
            {
                "williamboman/mason.nvim",
            },
            { "neovim/nvim-lspconfig" },
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
            { "zbirenbaum/copilot-cmp" },       -- Snippets
            { "L3MON4D3/LuaSnip" },             -- Required
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

        config = function()
            require("daze.config.nvim-treesitter")
        end,

        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
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

    { "ron-rs/ron.vim" },

    {
        "stevearc/dressing.nvim",
        config = function()
            require("daze.config.dressing")
        end,
    },
}
