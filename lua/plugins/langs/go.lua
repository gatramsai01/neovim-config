return {
	"ray-x/go.nvim",
	-- v0.11 still calls nvim-treesitter.query.iter_prepared_matches, which
	-- Neovim 0.12 no longer honors. Track master until a tag includes the fix.
	opts = {
		goimports = "goimports",
		lsp_cfg = false,
		lsp_keymaps = false,
		luasnip = true,
	},
    build =':lua require("go.install").update_all_sync()',
}
