vim.pack.add({ { src = "https://github.com/akinsho/toggleterm.nvim" } })

require("toggleterm").setup({ shell = "fish" })

require("which-key").add({ {
    "<M-i>",
    "<cmd>3ToggleTerm direction=float name=Floatting<cr>",
    desc = "Toggle float[i]ng terminal",
    mode = { "n", "t", "i" },
} })
