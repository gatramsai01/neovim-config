return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
        require("catppuccin").setup({
            -- Customize your flavor, background transparency, etc.
            flavour = "mocha", -- Available flavors: "latte", "frappe", "macchiato", and "mocha"
            transparent_background = true,
        })
        vim.cmd.colorscheme("catppuccin")
    end,
}
