vim.pack.add({
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/folke/which-key.nvim" },
})

require("which-key").add({
    { "<leader>x", group = "Telescope e[x]tras", icon = "" },
    { "<leader>t", group = "[t]elescope", icon = "" },
})
