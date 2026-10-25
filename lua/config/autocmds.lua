local ThePrimeagen_Fugitive = vim.api.nvim_create_augroup("ThePrimeagen_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
	group = ThePrimeagen_Fugitive,
	pattern = "*",
	callback = function()
		if vim.bo.ft ~= "fugitive" then
			return
		end

		local bufnr = vim.api.nvim_get_current_buf()
		local function bmap(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { buffer = bufnr, remap = false, desc = desc })
		end
		bmap("<leader>p", function()
			vim.cmd.Git("push")
		end, "git push")

		-- rebase always
		bmap("<leader>P", function()
			vim.cmd([[Git pull --rebase]])
		end, "git pull --rebase")

		-- NOTE: It allows me to easily set the branch i am pushing and any tracking
		-- needed if i did not set the branch up correctly
		bmap("<leader>t", ":Git push -u origin ", "push upstream")
	end,
})

-- vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
-- vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
