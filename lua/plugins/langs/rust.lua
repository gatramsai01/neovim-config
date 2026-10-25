return {
	"mrcjkb/rustaceanvim",
	version = "^9",
	lazy = false,
	init = function()
		vim.g.rustaceanvim = {
			server = {
				on_attach = function(client, bufnr)
					require("plugins.lsp.handlers").on_attach(client, bufnr)
					local function map(lhs, rhs, desc)
						vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
					end
					map("<leader>la", function()
						vim.cmd.RustLsp("codeAction")
					end, "rust code action")
					map("K", function()
						vim.cmd.RustLsp({ "hover", "actions" })
					end, "hover actions")
					map("<leader>rr", function()
						vim.cmd.RustLsp("runnables")
					end, "runnables")
					map("<leader>rt", function()
						vim.cmd.RustLsp("testables")
					end, "testables")
					map("<leader>re", function()
						vim.cmd.RustLsp("explainError")
					end, "explain error")
					map("<leader>rd", function()
						vim.cmd.RustLsp("renderDiagnostic")
					end, "render diagnostic")
					map("<leader>rm", function()
						vim.cmd.RustLsp("expandMacro")
					end, "expand macro")
					map("<leader>rc", function()
						vim.cmd.RustLsp("openCargo")
					end, "open Cargo.toml")
					map("<leader>rp", function()
						vim.cmd.RustLsp("parentModule")
					end, "parent module")
					local ok, wk = pcall(require, "which-key")
					if ok then
						wk.add({ { "<leader>r", group = "rust", buffer = bufnr } })
					end
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
