local langs = {
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
	"typescript",
	"json",
	"proto",
	"rust",
	"yaml",
	"toml",
}

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		-- no-op when the parsers are already installed
		require("nvim-treesitter").install(langs):wait(300000)

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("nvim_treesitter_start", { clear = true }),
			callback = function(args)
				local ft = args.match
				if ft == "css" then
					return
				end

				-- Plugin buffers (NvimTree, fidget, ...) have no parser.
				-- language.add() returns false instead of throwing, and
				-- vim.treesitter.start() asserts if called anyway.
				local lang = vim.treesitter.language.get_lang(ft)
				if not lang or not vim.treesitter.language.add(lang) then
					return
				end
				if not pcall(vim.treesitter.start, args.buf, lang) then
					return
				end

				if ft ~= "python" then
					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
