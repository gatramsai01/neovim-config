local status_ok, codecompanion = pcall(require, "codecompanion")
if not status_ok then
	return
end

local groq_adapter = require("codecompanion.adapters.http.openai_compatible")

groq_adapter.name = "groq"
groq_adapter.formatted_name = "Groq"
groq_adapter.opts.stream = true
groq_adapter.env.api_key = "GROQ_API_KEY"
groq_adapter.env.url = "https://api.groq.com/openai"
groq_adapter.schema.model.default = "moonshotai/kimi-k2-instruct"

local provider = {
	fuzzy_finder = "telescope",
	llm = "gemini",
	groq = "groq",
}

local gemini = require("codecompanion.adapters.http.gemini")

gemini.schema.model.default = "gemini-3-flash-preview"

vim.g.codecompanion_auto_tool_mode = true
-- Setup codecompanion
codecompanion.setup({
	opts = {
		log_level = "DEBUG",
	},
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
	interactions = {
		chat = {
			adapter = provider.llm,
			slash_commands = {
				["symbols"] = {
					opts = {
						contains_code = true,
						provider = provider.fuzzy_finder,
						silent = false,
					},
				},
				["file"] = {
					opts = {
						provider = provider.fuzzy_finder,
					},
				},
				["buffer"] = {
					opts = {
						provider = provider.fuzzy_finder,
					},
				},
			},
		},
		inline = { adapter = provider.llm },
		agent = { adapter = provider.llm },
	},
	display = {
		action_palette = {
			width = 95,
			height = 10,
			prompt = "Prompt ", -- Prompt used for interactive LLM calls
			provider = provider.fuzzy_finder, -- default|telescope|mini_pick
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
