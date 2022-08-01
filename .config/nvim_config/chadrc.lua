local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,

M.ui = {
  theme = "onedark",
}

-- custom.mappings

M.mappings = {
  disabled = {
    n = {
      ["<leader>e"] = "",
      ["<leader>n"] = "",
      ["<leader>rn"] = "",
      ["<S-s>"] = "",
    },
    v = {
      ["<S-s>"] = "",
    },
  },
  nvimtree = { n = { ["<C-b>"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" } } },
  neoformat = { n = { ["<leader>fm"] = { "<cmd> Neoformat <CR>", "Format the current file" } } },
  comment = {
    -- toggle comment in both modes
    n = {
      ["<leader>c<leader>"] = {
        function()
          require("Comment.api").toggle_current_linewise()
        end,

        "蘒  toggle comment",
      },
    },

    v = {
      ["<leader>c<leader>"] = {
        "<ESC><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>",
        "蘒  toggle comment",
      },
    },
  },
}

-- Custom Plugins
M.plugins = {
  override = {
    ["NvChad/ui"] = {
      statusline = {
        separator_style = "block",
      },
    },
    ["nvim-telescope/telescope.nvim"] = {
      options = {
        extensions_list = { "themes", "terms", "harpoon" },
      },
    },
  },
  user = {
    ["sbdchd/neoformat"] = {},
    ["ThePrimeagen/harpoon"] = {
      config = function()
        require("harpoon").setup {
          save_on_change = true,
        }
        -- require("telescope").load_extension "harpoon"
      end,
    },
    ["kylechui/nvim-surround"] = {
      config = function()
        require("nvim-surround").setup {}
      end,
    },
    ["tpope/vim-fugitive"] = {},
    ["lervag/vimtex"] = {},
    ["akinsho/flutter-tools.nvim"] = {
      config = function()
        require("nvim-surround").setup {}
      end,
    },
    ["goolord/alpha-nvim"] = {
      disable = false,
    },
    ["neovim/nvim-lspconfig"] = {
      config = function()
        require "plugins.configs.lspconfig"
        require "custom.plugins.lspconfig"
      end,
    },
  },
}

return M
