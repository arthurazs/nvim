return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		require("which-key").register({
			["<leader>l"] = { name = "+lsp" },
			["<leader>t"] = { name = "+telescope" }
		})
	end,
	opts = {}
}
