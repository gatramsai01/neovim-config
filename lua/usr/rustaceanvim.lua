local on_attach = require("usr.lsp.handlers").on_attach

vim.g.rustaceanvim = {
	server = {
		on_attach = on_attach,
	},
}
