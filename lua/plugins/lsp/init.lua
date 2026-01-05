local servers = {
	"lua_ls",
	-- "cssls",
	"gopls",
	-- "html",
	-- "ts_ls",
	-- "eslint",
	-- "pyright",
	-- "bashls",
	-- "jsonls",
	-- "yamlls",
	-- "tailwindcss",
	-- "helm_ls",
	-- "ruff",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

local handlers=require("plugins.lsp.handlers")
handlers.setup()

return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"saghen/blink.cmp",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason").setup(settings)
			require("mason-lspconfig").setup({
				ensure_installed = servers,
				automatic_installation = true,
			})

			local lspconfig = vim.lsp

			local opts = {}

			for _, server in pairs(servers) do
				if server == "eslint" then
					opts = {
						capabilities = handlers.capabilities,
					}
				else
					opts = {
						on_attach = handlers.on_attach,
						capabilities = handlers.capabilities,
					}
				end

				server = vim.split(server, "@")[1]

				local require_ok, conf_opts = pcall(require, "plugins.lsp.settings." .. server)
				if require_ok then
					opts = vim.tbl_deep_extend("force", conf_opts, opts)
				end
				lspconfig.config(server, opts)
			end
		end,
	},
}
