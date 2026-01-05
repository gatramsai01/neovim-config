local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	return
end

gitsigns.setup({
	signs = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged_enable = true,
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000,
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
})

local api = vim.api

-- api.nvim_set_hl(0, "GitSignsAdd", { link = "GitSignsAdd", fg = "#00ff00", bg = "NONE" })
-- api.nvim_set_hl(0, "GitSignsAddLn", { link = "GitSignsAddLn" })
-- api.nvim_set_hl(0, "GitSignsAddNr", { link = "GitSignsAddNr" })
-- api.nvim_set_hl(0, "GitSignsChange", { link = "GitSignsChange", fg = "#0000ff", bg = "NONE" })
-- api.nvim_set_hl(0, "GitSignsChangeLn", { link = "GitSignsChangeLn" })
-- api.nvim_set_hl(0, "GitSignsChangeNr", { link = "GitSignsChangeNr" })
-- api.nvim_set_hl(0, "GitSignsChangedelete", { link = "GitSignsChange" })
-- api.nvim_set_hl(0, "GitSignsChangedeleteLn", { link = "GitSignsChangeLn" })
-- api.nvim_set_hl(0, "GitSignsChangedeleteNr", { link = "GitSignsChangeNr" })
-- api.nvim_set_hl(0, "GitSignsDelete", { link = "GitSignsDelete", fg = "#ff0000", bg = "NONE" })
-- api.nvim_set_hl(0, "GitSignsDeleteLn", { link = "GitSignsDeleteLn" })
-- api.nvim_set_hl(0, "GitSignsDeleteNr", { link = "GitSignsDeleteNr" })
-- api.nvim_set_hl(0, "GitSignsTopdelete", { link = "GitSignsDelete" })
-- api.nvim_set_hl(0, "GitSignsTopdeleteLn", { link = "GitSignsDeleteLn" })
-- api.nvim_set_hl(0, "GitSignsTopdeleteNr", { link = "GitSignsDeleteNr" })

vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk)
vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk)
vim.keymap.set("v", "<leader>hs", function()
	gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end)
vim.keymap.set("v", "<leader>hr", function()
	gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end)
vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer)
vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk)
vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer)
vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk)
vim.keymap.set("n", "<leader>hb", function()
	gitsigns.blame_line({ full = true })
end)
vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame)
vim.keymap.set("n", "<leader>hd", gitsigns.diffthis)
vim.keymap.set("n", "<leader>hD", function()
	gitsigns.diffthis("~")
end)
vim.keymap.set("n", "<leader>td", gitsigns.toggle_deleted)
