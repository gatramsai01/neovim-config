return {
	"ray-x/go.nvim",
	version = "*",
	opts = {
		goimports = "goimports",
		lsp_cfg = false,
		lsp_keymaps = false,
		luasnip = true,
	},
    build =':lua require("go.install").update_all_sync()',
}
