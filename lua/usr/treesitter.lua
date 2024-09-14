local M = {}
function M.config()
	local treesitter = require("nvim-treesitter")
	local configs = require("nvim-treesitter.configs")

	configs.setup({
		ensure_installed = {
			"vimdoc",
			"lua",
			"markdown",
			"markdown_inline",
			"bash",
			"python",
			"vim",
			"go",
			"gomod",
			"gosum",
			"gotmpl",
			"gowork",
			"html",
			"javascript",
			"json",
			"proto",
			"pip requirements",
			"rust",
			"yaml",
			"toml",
		}, -- put the language you want in this array
		-- ensure_installed = "all", -- one of "all" or a list of languages
		ignore_install = { "" }, -- List of parsers to ignore installing
		sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

		auto_install = true,
		highlight = {
			enable = true, -- false will disable the whole extension
			disable = { "css" }, -- list of language that will be disabled
		},
		autopairs = {
			enable = true,
		},
		indent = { enable = true, disable = { "python", "css" } },

		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
	})
vim.g.skip_ts_context_commentstring_module = true

return M
