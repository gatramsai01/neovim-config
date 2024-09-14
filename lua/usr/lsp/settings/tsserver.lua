local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

return {
	commands = {
		OrganizeImports = {
			organize_imports,
			description = "organize imports with tsserver",
		},
	},
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	init_options = {
		preferences = {
			-- other preferences...
			includeCompletionsForImportStatements = true,
			includeCompletionsForModuleExports = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            displayPartsForJSDoc= true,
			importModuleSpecifierPreference = "relative",
			importModuleSpecifierEnding = "minimal",
		},
	},
}
