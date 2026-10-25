vim.opt.mouse = ""

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.nu = true
vim.opt.rnu = true

vim.opt.updatetime = 50

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- Remote hosts have no wl-copy/xsel. unnamedplus disables Neovim's automatic
-- OSC 52, so yank never reaches Alacritty. Copy via OSC 52; do not query the
-- clipboard on paste (Alacritty is OnlyCopy and the query hangs startup).
local function has_clipboard_tool()
	if vim.env.WAYLAND_DISPLAY and vim.fn.executable("wl-copy") == 1 and vim.fn.executable("wl-paste") == 1 then
		return true
	end
	if vim.env.DISPLAY and (vim.fn.executable("xsel") == 1 or vim.fn.executable("xclip") == 1) then
		return true
	end
	return false
end

if not has_clipboard_tool() then
	local last = { { "" }, "v" }
	local function copy(reg)
		local write = require("vim.ui.clipboard.osc52").copy(reg)
		return function(lines, regtype)
			last = { lines, regtype or "v" }
			write(lines)
		end
	end
	local function paste()
		return last
	end
	vim.g.clipboard = {
		name = "OSC 52",
		copy = {
			["+"] = copy("+"),
			["*"] = copy("*"),
		},
		paste = {
			["+"] = paste,
			["*"] = paste,
		},
		cache_enabled = true,
	}
end

vim.opt.clipboard = "unnamedplus"
vim.o.winborder = "rounded"

vim.opt.termguicolors = true
vim.opt.hlsearch = false
vim.opt.incsearch = true


-- nvim-ufo --
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- ts-context-comment --
vim.g.skip_ts_context_commentstring_module = true
-- undotree --
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.local/share/nvim/undodir")
vim.g.undotree_WindowLayout = 4
-- blink-cmp --
vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "none" }) -- Optional: for truly transparent background
vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { bg = "none",fg="#374d71" })

