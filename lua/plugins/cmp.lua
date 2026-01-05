return {
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release
		version = "v2.*",
		-- install jsregexp (optional!)
		build = "make install_jsregexp",
		config = function()
			-- your luasnip config goes here
			require("luasnip.loaders.from_vscode").lazy_load()
			-- ... other config
		end,
	},

	{
		"saghen/blink.cmp",
		version = "*",
		opts = {
			keymap = {
				preset = "none",
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide", "fallback" },
				["<CR>"] = { "accept", "fallback" },

				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },

				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },

				["<Tab>"] = {
					function(cmp)
						if cmp.is_visible() then
							return cmp.select_next()
						elseif cmp.snippet_active() then
							return cmp.snippet_forward()
						end
					end,
					"fallback",
				},
				["<S-Tab>"] = {
					function(cmp)
						if cmp.is_visible() then
							return cmp.select_prev()
						elseif cmp.snippet_active() then
							return cmp.snippet_backward()
						end
					end,
					"fallback",
				},
			},
			appearance = {
				use_nvim_cmp_as_default = false,
				nerd_font_variant = "mono",
				kind_icons = {
					Text = "󰉿",
					Method = "󰆧",
					Function = "󰊕",
					Constructor = "",
					Field = " ",
					Variable = "󰀫",
					Class = "󰠱",
					Interface = "",
					Module = "",
					Property = "󰜢",
					Unit = "󰑭",
					Value = "󰎠",
					Enum = "",
					Keyword = "󰌋",
					Snippet = "",
					Color = "󰏘",
					File = "󰈙",
					Reference = "",
					Folder = "󰉋",
					EnumMember = "",
					Constant = "󰏿",
					Struct = "",
					Event = "",
					Operator = "󰆕",
					TypeParameter = " ",
				},
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			snippets = {
				preset = "luasnip",
			},
			completion = {
				menu = {
					border = "rounded",
					draw = {
						columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "source_name" } },
					},
				},
				documentation = {
					window = {
						border = "rounded",
						winblend = 0,
						winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
					},
					auto_show = true,
					auto_show_delay_ms = 500,
				},
				ghost_text = { enabled = false },
			},
		},
	},
}
