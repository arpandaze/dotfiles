vim.api.nvim_set_keymap("n", ":", ";", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>e", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
