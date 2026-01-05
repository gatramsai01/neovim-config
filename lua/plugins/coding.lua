local ftMap = {
	yaml = { "treesitter", "indent" },
	json = { "treesitter", "indent" },
}
return {
	{
		"kevinhwang91/nvim-ufo",
		commit = "5b75cf5fdb74054fc8badb2e7ca9911dc0470d94",
		opts = {
			provider_selector = function(bufnr, filetype, buftype)
				return ftMap[filetype]
			end,
		},
	},
}
