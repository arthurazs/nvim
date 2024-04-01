vim.opt.showmode = false

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"akinsho/bufferline.nvim",
		"navarasu/onedark.nvim",
	},
	config = function()
		vim.opt.termguicolors = true
		require("lualine").setup({
			options = { theme = "onedark", globalstatus = true },
			sections = {
				lualine_c = { "filename", "selectioncount" },
				lualine_x = { "searchcount", "encoding", "fileformat", "filetype" },
			},
		})
		require("bufferline").setup({
			options = { always_show_bufferline = false },
		})
	end,
}
