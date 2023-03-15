local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.eslint,
    -- null_ls.builtins.completion.spell,

    -- JS TS
    null_ls.builtins.formatting.prettier,

    -- Python
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.diagnostics.ruff,

    -- Rust
    null_ls.builtins.formatting.rustfmt,

    -- Golang
    null_ls.builtins.formatting.gola,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports_reviser,
  },
})
