return {
	"folke/which-key.nvim",
	version = "*",
	-- Load now so <leader>w is a window prefix before any buffer attaches.
	lazy = false,
	opts = {
		delay = 300,
		win = {
			border = "rounded",
		},
		-- Space is a builtin motion, so <auto> will not open the leader popup.
		-- Do not include insert mode; blink.cmp owns those keys.
		triggers = {
			{ "<auto>", mode = "nxso" },
			{ "<leader>", mode = { "n", "v" } },
		},
		spec = {
			{ "<leader>f", group = "find" },
			{ "<leader>g", group = "git" },
			{ "<leader>c", group = "codecompanion" },
			{ "<leader>w", proxy = "<c-w>", group = "window", mode = { "n", "v" } },
		},
	},
}
