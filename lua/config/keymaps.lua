vim.keymap.set("i", "jk", "<ESC>", { desc = "leave insert" })
vim.keymap.set("i", "kj", "<ESC>", { desc = "leave insert" })

local opts = { noremap = true, silent = true }

local function map(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
end

-- which-key maps <Space> in normal and visual. Keep it from moving the cursor
-- in select and operator-pending, where the popup is not triggered.
vim.keymap.set({ "s", "o" }, "<Space>", "<Nop>", opts)

map("n", "<C-d>", "<C-d>zz", "half-page down")
map("n", "<C-u>", "<C-u>zz", "half-page up")

-- copy and paste from system clipboard
map({ "n", "v" }, "<leader>y", '"+y', "yank to clipboard")
map({ "n", "v" }, "<leader>p", '"+p', "paste clipboard")
map({ "n", "v" }, "<leader>Y", '"*y', "yank to selection")
map({ "n", "v" }, "<leader>P", '"*p', "paste selection")
map({ "n", "v" }, "<leader>d", '"_d', "delete without yanking")
-- vim.keymap.set({"n","v"},"<leader>c","\"_c",opts)
-- vim.keymap.set({"n","v"},"<leader>x","\"_x",opts)
-- vim.keymap.set({"n","v"},"<leader>p","\"_dP",opts

map("n", "<C-k>", "<cmd>cnext<CR>zz", "next quickfix item")
map("n", "<C-j>", "<cmd>cprev<CR>zz", "previous quickfix item")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "next location-list item" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "previous location-list item" })

-- nvim-tree --
vim.keymap.set("n", "<C-h>", ":NvimTreeToggle<CR>", { silent = true, noremap = true, desc = "toggle file tree" })
-- undo tree toggle
map("n", "<leader>u", vim.cmd.UndotreeToggle, "undo tree")
-- codecompanion --
vim.keymap.set({ "n", "v" }, "<leader>cc", ":CodeCompanionChat Toggle<CR>", {
	noremap = true,
	silent = true,
	desc = "toggle chat",
})
-- nvim-ufo --
local ufo = require("ufo")
vim.keymap.set("n", "zR", ufo.openAllFolds, { desc = "open all folds" })
vim.keymap.set("n", "zM", ufo.closeAllFolds, { desc = "close all folds" })
-- fugitive.vim --
vim.keymap.set("n", "<leader>gs", function()
	vim.cmd("Git | resize 20 | wincmd J")
end, { desc = "git status" })
