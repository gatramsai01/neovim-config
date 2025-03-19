local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
    return
end

harpoon:setup()
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>hq", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>hw", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>ho", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>hp", function() harpoon:list():select(4) end)
-- vim.keymap.set("n", "<leader>hr", function() harpoon:list():remove() end)
-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>bh", function() harpoon:list():prev() end)
vim.keymap.set("n", "<leader>bl", function() harpoon:list():next() end)
