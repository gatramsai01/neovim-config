local status_ok, go = pcall(require, "go")
if not status_ok then
	return
end

go.setup({
	goimports = "goimports",
	lsp_cfg = false,
	lsp_keymaps = false,
	luasnip = true,
})
