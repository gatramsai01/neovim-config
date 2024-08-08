local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<CR>", { silent = true, noremap = true })

nvim_tree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		number = true,
		relativenumber = true,
		width = 30,
		side = "left",
	},
	renderer = {
		group_empty = true,
		root_folder_modifier = ":t",
		icons = {
			show = {
				modified = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
		dotfiles = true,
	},
})
