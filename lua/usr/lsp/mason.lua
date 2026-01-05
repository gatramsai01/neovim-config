local servers = {
	"lua_ls",
	"cssls",
	"gopls",
	"html",
	"ts_ls",
	"eslint",
	"pyright",
	"bashls",
	"jsonls",
	"yamlls",
	"tailwindcss",
	"helm_ls",
	"ruff",
	"terraformls",
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

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	if server == "eslint" then
		opts = {
			capabilities = require("usr.lsp.handlers").capabilities,
		}
	else
		opts = {
			on_attach = require("usr.lsp.handlers").on_attach,
			capabilities = require("usr.lsp.handlers").capabilities,
		}
	end

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "usr.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end
	lspconfig[server].setup(opts)
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client == nil then
			return
		end
		if client.name == "ruff" then
			-- Disable hover in favor of Pyright
			client.server_capabilities.hoverProvider = false
		end
	end,
	desc = "LSP: Disable hover capability from Ruff",
})
