vim.g.loaded_netrw = 1

vim.g.loaded_netrwPlugin = 1

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

-- undo tree
vim.g.undotree_SplitWidth = 30
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
