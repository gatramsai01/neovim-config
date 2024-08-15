local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
	return
end

nightfox.setup({
	options = {
		-- transparent = true,
		compile_path = vim.fn.stdpath("cache") .. "/nightfox",
		compile_file_suffix = "_compiled",
		styles = {
			comments = "italic",
			keywords = "bold",
		},
	},
})
vim.cmd("colorscheme carbonfox")
