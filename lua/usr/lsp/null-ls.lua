local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local diagnostics = null_ls.builtins.diagnostics
-- local eslint_d=
null_ls.setup({
	debug = false,
	sources = {
		require("none-ls.formatting.eslint_d").with({
			filetypes = { "javascript", "typescript", "vue", "html", "css" },
			condition = function()
				return require("null-ls.utils").root_pattern(
					"eslint.config.js",
					-- https://eslint.org/docs/user-guide/configuring/configuration-files#configuration-file-formats
					".eslintrc",
					".eslintrc.js",
					".eslintrc.cjs",
					".eslintrc.yaml",
					".eslintrc.yml",
					".eslintrc.json",
					"package.json"
				)(vim.api.nvim_buf_get_name(0)) ~= nil
			end,
		}),
		formatting.prettierd.with({
			-- use prettier only with prettierrc present
			condition = function()
				return require("null-ls.utils").root_pattern(
					".prettierrc",
					".prettierrc.json",
					".prettierrc.yml",
					".prettierrc.yaml",
					".prettierrc.json5",
					".prettierrc.js",
					".prettierrc.cjs",
					".prettierrc.toml",
					"prettier.config.js",
					"prettier.config.cjs"
				)(vim.api.nvim_buf_get_name(0)) ~= nil
			end,
		}),
		-- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		require("none-ls.formatting.rustfmt"),
		-- diagnostics.flake8
	},
})
