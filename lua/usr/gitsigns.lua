local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	return
end

gitsigns.setup({
	signs = {
		add = { hl = "GitSignsAdd", text = " ", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = " ", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = " ", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = "󱅁 ", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = {
			hl = "GitSignsChange",
			text = "󰍷 ",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
	},
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
	current_line_blame_formatter_opts = {
		relative_time = false,
	},
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
	yadm = {
		enable = false,
	},
})

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
