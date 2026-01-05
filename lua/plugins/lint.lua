return {
	"mfussenegger/nvim-lint",
	version = "*",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local lint = require("lint")

		-- Define which linters to use for specific filetypes
		lint.linters_by_ft = {
			markdown = { "markdownlint" },
			python = { "ruff" },
			lua = { "luac" },
			-- Add other file types and linters as needed
		}

		-- Autocommand to run linting on certain events
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = vim.api.nvim_create_augroup("lint", { clear = true }),
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
