local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
	return
end

vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
-- Keymaps
vim.keymap.set("n", "zR", ufo.openAllFolds)
vim.keymap.set("n", "zM", ufo.closeAllFolds)

local ftMap = {
	yaml = { "treesitter", "indent" },
	json = { "treesitter", "indent" },
}

ufo.setup({
	provider_selector = function(bufnr, filetype, buftype)
		return ftMap[filetype]
	end,
})
