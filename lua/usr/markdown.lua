-- local status_ok, markdown = pcall(require, "render-markdown")
-- if not status_ok then
--     print("error",status_ok)
-- 	return
-- end
--
-- markdown.setup({
-- 	file_types = { "markdown", "codecompanion" },
-- })
--

local status_ok, markview = pcall(require, "markview")
if not status_ok then
	print("error", status_ok)
	return
end

markview.setup({
	preview = {
        enable = true,
		filetypes = { "markdown", "codecompanion" },
        ignore_buftypes={}
	},
})
