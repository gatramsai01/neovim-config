local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use({ "wbthomason/packer.nvim" })
	use({ "nvim-tree/nvim-tree.lua", tag = "v1.12.0", requires = { "nvim-tree/nvim-web-devicons" } }) --file tree
	use({
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	-- LSP
	use({ "neovim/nvim-lspconfig", tag = "v1.7.0" }) -- enable LSP
	use({ "williamboman/mason.nvim", tag = "v1.11.0" }) -- simple to use language server installer
	use({ "williamboman/mason-lspconfig.nvim", tag = "v1.32.0" })
	use({ "tamago324/nlsp-settings.nvim" })
	use({ "nvimtools/none-ls.nvim", requires = { "nvimtools/none-ls-extras.nvim" } })
	use({ "mfussenegger/nvim-dap", tag = "0.8.0" }) -- debug adapeter protocol
	-- CMP
	use({ "hrsh7th/nvim-cmp", tag = "v0.0.2" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	-- Snippets
	use({
		"L3MON4D3/LuaSnip",
		tag = "v2.*",
		run = "make install_jsregexp",
		requires = { "rafamadriz/friendly-snippets" },
	})
	-- Comment Plugins
	use({ "numToStr/Comment.nvim", tag = "v0.8.0" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "folke/ts-comments.nvim", tag = "v1.5.0" })
	--
	use({ "nvim-treesitter/nvim-treesitter", tag = "v0.9.3", { run = ":TSUpdate" } }) -- treesitter plugin
	use({ "RRethy/vim-illuminate", commit = "5eeb795" })
	-- fuzzy finder
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.8" })
	use({ "nvim-lua/plenary.nvim", branch = "master" })
	-- Git Plugins
	use({ "tpope/vim-fugitive" })
	use({ "lewis6991/gitsigns.nvim", tag = "v0.9.0" })
	--
	use({ "mbbill/undotree", tag = "rel_6.1" }) -- undotree plugin
	use({ "catppuccin/nvim", tag = "v1.9.0" })
	use({ "j-hui/fidget.nvim", tag = "v1.4.5" })
	use({ "kevinhwang91/nvim-ufo", tag = "v1.4.0", requires = { "kevinhwang91/promise-async" } }) -- fold plugin
	use({ "nvim-lualine/lualine.nvim" })
	-- language plugins
	use({ "ray-x/go.nvim", tag = "v0.10.0" }) -- golang plugin
	use({ "mrcjkb/rustaceanvim", tag = "5.2.0" }) -- rust plugin
	use({ "ThePrimeagen/harpoon", branch = "harpoon2" })

	use({ "windwp/nvim-ts-autotag" })
	use({ "kylechui/nvim-surround", tag = "v2.3.0" })

	use({ "OXY2DEV/markview.nvim", tag = "v25.5.1" })
	use({ "olimorris/codecompanion.nvim", requires = { "ravitemer/codecompanion-history.nvim" } })

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
