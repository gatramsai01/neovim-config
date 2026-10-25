return {
	"mrcjkb/rustaceanvim",
	version = "^9",
	lazy = false,
	init = function()
		vim.g.rustaceanvim = {
			server = {
				on_attach = function(client, bufnr)
					require("plugins.lsp.handlers").on_attach(client, bufnr)
					local opts = { buffer = bufnr, silent = true }
					vim.keymap.set("n", "<leader>la", function()
						vim.cmd.RustLsp("codeAction")
					end, opts)
					vim.keymap.set("n", "K", function()
						vim.cmd.RustLsp({ "hover", "actions" })
					end, opts)
					vim.keymap.set("n", "<leader>rr", function()
						vim.cmd.RustLsp("runnables")
					end, opts)
					vim.keymap.set("n", "<leader>rt", function()
						vim.cmd.RustLsp("testables")
					end, opts)
					vim.keymap.set("n", "<leader>re", function()
						vim.cmd.RustLsp("explainError")
					end, opts)
					vim.keymap.set("n", "<leader>rd", function()
						vim.cmd.RustLsp("renderDiagnostic")
					end, opts)
					vim.keymap.set("n", "<leader>rm", function()
						vim.cmd.RustLsp("expandMacro")
					end, opts)
					vim.keymap.set("n", "<leader>rc", function()
						vim.cmd.RustLsp("openCargo")
					end, opts)
					vim.keymap.set("n", "<leader>rp", function()
						vim.cmd.RustLsp("parentModule")
					end, opts)
				end,
				default_settings = {
					["rust-analyzer"] = {
						check = { command = "clippy" },
					},
				},
			},
		}
	end,
}
