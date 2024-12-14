-- exits interactive mode
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "kj", "<ESC>")

local opts = { noremap = true, silent = true }
--Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<C-d>", "<C-d>zz") -- move page down with cursor in middle
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- moves page up with cursor in the middle

-- copy and past from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', opts)
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', opts)
vim.keymap.set({ "n", "v" }, "<leader>Y", '"*y', opts)
vim.keymap.set({ "n", "v" }, "<leader>P", '"*p', opts)
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', opts)
-- vim.keymap.set({"n","v"},"<leader>c","\"_c",opts)
-- vim.keymap.set({"n","v"},"<leader>x","\"_x",opts)
-- vim.keymap.set({"n","v"},"<leader>p","\"_dP",opts

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", opts)
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", opts)
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, opts) -- undo tree toggle

vim.keymap.set({ "n", "v" }, "<leader>w", "<C-w>", opts)
