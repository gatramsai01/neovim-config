local status_ok, codecompanion = pcall(require, "codecompanion")
if not status_ok then
	return
end

local const = {
	provider = "telescope",
}

vim.g.codecompanion_auto_tool_mode = true

-- Setup codecompanion
codecompanion.setup({
	opts = {
		log_level = "TRACE",
	},
	adapters = {
		gemini = function()
			return require("codecompanion.adapters").extend("gemini", {
				env = {
					api_key = "AIzaSyAR3LsU7xTOhwQmXkS4sqbieYz6luc0ToE",
				},
			})
		end,
	},
	strategies = {
		chat = {
			adapter = "gemini",
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
		inline = { adapter = "gemini" },
		agent = { adapter = "gemini" },
	},
	display = {
		action_palette = {
			width = 95,
			height = 10,
			prompt = "Prompt ", -- Prompt used for interactive LLM calls
			provider = const.provider, -- default|telescope|mini_pick
			opts = {
				show_default_actions = true, -- Show the default actions in the action palette?
				show_default_prompt_library = true, -- Show the default prompt library in the action palette?
			},
		},
		chat = {
			window = {
				position = "right",
			},
		},
	},
})
