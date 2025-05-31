vim.filetype.add({
    pattern = {
        [".*/templates/.*%.yaml"] = "helm",
    },
})
return {
	settings = {
		["helm-ls"] = {
			yamlls = {
				enable = true,
			},
			logLevel = "info",
			valuesFiles = {
				mainValuesFile = "values.yaml",
				lintOverlayValuesFile = "values.lint.yaml",
				additionalValuesFilesGlobPattern = "values*.yaml",
			},
		},
	},
}
