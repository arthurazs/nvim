vim.pack.add({ { src = "https://github.com/navarasu/onedark.nvim" } })
require("onedark").setup({
    style = "deep",
    transparent = true,
    lualine = { transparent = true },
    toggle_style_key = "<leader>o",
    toggle_style_list = { "light", "deep" },
})
require("onedark").load()
