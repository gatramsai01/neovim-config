local status_ok, codecompanion = pcall(require, "codecompanion")
if not status_ok then
	return
end

local groq_adapter = require("codecompanion.adapters.openai_compatible")

groq_adapter.name = "groq"
groq_adapter.formatted_name = "Groq"
groq_adapter.opts.stream = true
groq_adapter.env.api_key = "GROQ_API_KEY"
groq_adapter.env.url = "https://api.groq.com/openai"
groq_adapter.schema.model.default = "meta-llama/llama-4-maverick-17b-128e-instruct"

local const = {
	provider = "telescope",
	gemini = "gemini",
	groq = "groq",
}

vim.g.codecompanion_auto_tool_mode = true
-- Setup codecompanion
codecompanion.setup({
	extensions = {
		history = {
			enable = true,
			opts = {
				expiration_days = 15,
			},
		},
	},
	adapters = {
		groq = groq_adapter,
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

vim.keymap.set({ "n", "v" }, "<leader>cc", ":CodeCompanionChat Toggle<CR>", { noremap = true, silent = true })
