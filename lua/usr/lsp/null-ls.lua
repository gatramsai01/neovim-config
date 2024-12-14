local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local diagnostics = null_ls.builtins.diagnostics
-- local eslint_d=

local root_has_file = function(files)
	return function(utils)
		return utils.root_has_file(files)
	end
end

local eslint_root_files = { ".eslintrc", ".eslintrc.js", ".eslintrc.json" }
local prettier_root_files = { ".prettierrc", ".prettierrc.js", ".prettierrc.json" }

null_ls.setup({
	debug = false,
	sources = {
		require("none-ls.formatting.eslint_d").with({
			filetypes = { "javascript", "typescript", "vue", "html", "css" },
			condition = function(utils)
				local has_eslint = root_has_file(eslint_root_files)(utils)
				local has_prettier = root_has_file(prettier_root_files)(utils)
				return has_eslint and not has_prettier
			end,
		}),
		formatting.prettierd.with({
			-- use prettier only with prettierrc present
			condition = function(utils)
				local has_eslint = root_has_file(eslint_root_files)(utils)
				local has_prettier = root_has_file(prettier_root_files)(utils)
				return not has_eslint and has_prettier
			end,
		}),
		-- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		require("none-ls.formatting.rustfmt"),
		require("none-ls.diagnostics.ruff"),
	},
})
