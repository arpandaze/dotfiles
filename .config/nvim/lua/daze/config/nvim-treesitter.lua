require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "python",
        "php",
        "bash",
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

    -- incremental_selection = {
    --   enable = true,
    --   keymaps = {
    --     node_incremental = '.',
    --     scope_incremental = 'grc',
    --     node_decremental = ',',
    --   },
    -- },
    --
    textobjects = {
      select = {
        enable = false,
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@conditional.outer',
          ['ic'] = '@conditional.inner',
          ['ai'] = '@call.outer',
          ['ii'] = '@call.inner',
          -- ['ab'] = '@block.outer',
          -- ['ib'] = '@block.inner',
          ['is'] = '@statement.inner',
          ['as'] = '@statement.outer',
          ['aC'] = '@class.outer',
          ['iC'] = '@class.inner',
          ['al'] = '@loop.outer',
          ['il'] = '@loop.inner',
        },
      },

      swap = {
        enable = false,
        swap_next = {
          ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>A'] = '@parameter.inner',
        },
      },

      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = { query = '@class.outer', desc = 'Next class start' },
          [']o'] = '@loop.*',
          [']s'] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
          [']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
        goto_next = {
          [']d'] = '@conditional.outer',
        },
        goto_previous = {
          ['[d'] = '@conditional.outer',
        },
      },
      lsp_interop = {
        enable = true,
        border = 'none',
        peek_definition_code = {
          ['<leader>sd'] = '@function.outer',
          ['<leader>sD'] = '@class.outer',
        },
      },
    }
})
