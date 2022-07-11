local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,

M.ui = {
  theme = "onedark",
  statusline = {
    separator_style = "block", -- default/round/block/arrow
    config = "%!v:lua.require('ui.statusline').run()",
    override = {},
  },
}

-- custom.mappings

M.mappings = {
  disabled = {
    n = {
      ["<leader>e"] = "",
      ["<leader>rn"] = "",
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
  user = {
    ["sbdchd/neoformat"] = {},
    ["tpope/vim-surround"] = {},
    ["tpope/vim-fugitive"] = {},
    ["lervag/vimtex"] = {},
    ["goolord/alpha-nvim"] = {
      disable = false,
    },
  },

  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },
}

return M
