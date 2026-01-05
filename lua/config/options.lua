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
-- vim.opt.clipboard = "unnamedplus"

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

