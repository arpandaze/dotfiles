local opts = { noremap = true, silent = true }

local remap = vim.api.nvim_set_keymap

-- Space key as leader
remap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clear highlight on esc
remap("n", "<ESC>", "<CMD>noh<CR>", opts)

-- Map ; to : and vice-versa for normal mode
remap("n", ":", ";", opts)
remap("n", ";", ":", opts)

-- Select all
remap("n", "<leader>a", "ggVG", opts)

-- Toggle Netrw
remap("n", "<C-b>", "<CMD>NvimTreeToggle<CR>", opts)

-- Don't replace data on visual paste
remap("v", "p", '"_dP', opts)

-- Format current file
remap("n", "<leader>fm", "<cmd> :Neoformat<CR>", opts)

-- Toggle Comment
remap("n", "<leader>c<leader>", '<CMD> lua require("Comment.api").toggle.linewise.current()<CR>', opts)
remap("v", "<leader>c<leader>", '<ESC><CMD> lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', opts)

-- Telescope Binds
remap("n", "<leader>ff", "<CMD>Telescope find_files<CR>", opts)
remap("n", "<leader>fw", "<CMD>Telescope live_grep<CR>", opts)

-- LSP Binds
remap("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)
remap("n", "<space>e", "<CMD> lua vim.diagnostic.open_float()<CR>", opts)
remap("n", "[d", "<CMD> lua vim.diagnostic.goto_prev()<CR>", opts)
remap("n", "]d", "<CMD> lua vim.diagnostic.goto_next()<CR>", opts)
remap("n", "<leader>q", "<CMD> lua vim.diagnostic.setloclist()<CR>", opts)
remap("n", "gD", "<CMD> lua vim.lsp.buf.declaration()<CR>", opts)
remap("n", "gd", "<CMD> lua vim.lsp.buf.definition()<CR>", opts)
remap("n", "K", "<CMD> lua vim.lsp.buf.hover()<CR>", opts)
remap("n", "gi", "<CMD> lua vim.lsp.buf.implementation()<CR>", opts)
remap("n", "<C-k>", "<CMD> lua vim.lsp.buf.signature_help()<CR>", opts)

-- Select all
remap("n", "<leader>a", "ggVG", { noremap = true, silent = true })

-- Harpoon Binds
remap("n", "<leader>n", ":lua require('harpoon.ui').nav_next()<CR>", opts)
remap("n", "<leader>N", ":lua require('harpoon.ui').nav_prev()<CR>", opts)
remap("n", "<leader><leader>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
remap("n", "ma", ":lua require('harpoon.mark').add_file()<CR>", opts)
remap("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
remap("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
remap("n", "<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>", opts)

-- Leap search visible space
remap("n", "<leader>g", "<CMD> lua require('leap').leap { target_windows = { vim.fn.win_getid() } }<CR>", opts)
