local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
	return
end

catppuccin.setup({
	flavor = "mocha",
	transparent_background = true,
	default_integrations = true,
	styles = {
		comments = { "italic" },
		keywords = { "bold" },
	},
	intergrations = {
		treesitter = true,
		nvimtree = true,
		mason = true,
	},
})

vim.cmd.colorscheme("catppuccin")
