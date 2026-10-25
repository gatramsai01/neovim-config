local M = {}

local status_ok, blink_cmp = pcall(require, "blink-cmp")
if not status_ok then
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
M.capabilities = blink_cmp.get_lsp_capabilities(M.capabilities)

M.setup = function()
	local config = {
		virtual_text = false, -- disable virtual text
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.HINT] = "",
				[vim.diagnostic.severity.INFO] = "",
			},
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)
end

local function lsp_keymaps(bufnr)
	local function map(lhs, rhs, desc)
		vim.keymap.set("n", lhs, rhs, { buffer = bufnr, noremap = true, silent = true, desc = desc })
	end
	map("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", "declaration")
	map("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "definition")
	map("K", "<cmd>lua vim.lsp.buf.hover()<CR>", "hover")
	map("gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", "implementation")
	map("gr", "<cmd>lua vim.lsp.buf.references()<CR>", "references")
	map("gl", "<cmd>lua vim.diagnostic.open_float()<CR>", "line diagnostics")
	map("<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", "format")
	map("<leader>li", "<cmd>LspInfo<cr>", "lsp info")
	map("<leader>lI", "<cmd>LspInstallInfo<cr>", "lsp install info")
	map("<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", "code action")
	map("<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", "next diagnostic")
	map("<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "previous diagnostic")
	map("<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", "rename")
	map("<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "signature help")
	map("<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", "diagnostic loclist")

	local ok, wk = pcall(require, "which-key")
	if ok then
		wk.add({ { "<leader>l", group = "lsp", buffer = bufnr } })
	end
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end

	if client.name == "sumneko_lua" then
		client.server_capabilities.documentFormattingProvider = false
	end

	lsp_keymaps(bufnr)
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		print("missing vim-illuminate")
		return
	end
	illuminate.on_attach(client)
end

return M
