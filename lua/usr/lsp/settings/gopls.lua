local utils = require("lspconfig/util")
return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = utils.root_pattern("go.mod", "go.work", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceHolder = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
}
