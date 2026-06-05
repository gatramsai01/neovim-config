return {
	{
		"olimorris/codecompanion.nvim",
		version = "v18.3.1",
		config = function()
			local groq_adapter = require("codecompanion.adapters.http.openai_compatible")

			groq_adapter.name = "groq"
			groq_adapter.formatted_name = "Groq"
			groq_adapter.opts.stream = true
			groq_adapter.env.api_key = "GROQ_API_KEY"
			groq_adapter.env.url = "https://api.groq.com/openai"
			groq_adapter.schema.model.default = "moonshotai/kimi-k2-instruct-0905"

			local const = {
				provider = "telescope",
				gemini = "gemini",
				groq = "groq",
			}
			local gemini = require("codecompanion.adapters.http.gemini")
			gemini.schema.model.default = "gemini-3-flash-preview"

			require("codecompanion").setup({
				extensions = {
					history = {
						enable = true,
						opts = {
							expiration_days = 15,
						},
					},
				},
				adapters = {
					http = {
						groq = groq_adapter,
					},
				},
				strategies = {
					chat = {
						adapter = const.groq,
						slash_commands = {
							["symbols"] = {
								opts = {
									contains_code = true,
									provider = const.provider,
									silent = false,
								},
							},
							["file"] = {
								opts = {
									provider = const.provider,
								},
							},
							["buffer"] = {
								opts = {
									provider = const.provider,
								},
							},
						},
					},
					inline = { adapter = const.groq },
					agent = { adapter = const.gemini },
				},
				display = {
					action_palette = {
						width = 95,
						height = 10,
						prompt = "Prompt ",
						provider = const.provider,
						opts = {
							show_default_actions = true,
							show_default_prompt_library = true,
						},
					},
					chat = {
						window = {
							position = "right",
						},
					},
				},
			})
		end,
	},
	{
		"OXY2DEV/markview.nvim",
		version = "v25.9.0",
		opts = {
			preview = {
				enable = true,
				filetypes = { "markdown", "codecompanion" },
				ignore_buftypes = {},
				map_gx = false,
			},
		},
	},
}
