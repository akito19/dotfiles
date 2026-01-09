-- Keymaps configuration
-- Migrated from .vimrc

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Escape mapping
keymap("i", "<C-[>", "<Esc>", opts)

-- Split editor with tag jump
keymap("n", "<C-l>", ":vsp<CR>:exe('tjump ' .. vim.fn.expand('<cword>'))<CR>", opts)
keymap("n", "<C-h>", ":split<CR>:exe('tjump ' .. vim.fn.expand('<cword>'))<CR>", opts)

-- Ctags navigation
keymap("n", "<C-]>", "g<C-]>", opts)
keymap("n", "<C-[>", "<C-t>", opts)

-- LSP keymaps are configured in plugins/lsp.lua
