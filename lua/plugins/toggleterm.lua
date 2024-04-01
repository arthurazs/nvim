return {
	'akinsho/toggleterm.nvim', version = "*", config = true,
	keys = {
		{
			"<A-t>", "<cmd>1ToggleTerm direction=horizontal size=10 name=Horizontal<cr>",
			desc = "Toggle horizontal [t]erminal", mode = { "n", "t" }
		},
		{
			"<A-v>", "<cmd>2ToggleTerm direction=vertical size=50 name=Vertical<cr>",
			desc = "Toggle [v]ertical terminal", mode = { "n", "t" }
		},
		{
			"<A-i>", "<cmd>3ToggleTerm direction=float name=Floatting<cr>",
			desc = "Toggle float[i]ng terminal", mode = { "n", "t" }
		}
	}
}
