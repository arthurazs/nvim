return {
    "navarasu/onedark.nvim",
    lazy=false,
    priority=1000,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "echasnovski/mini.icons",
    },
    config = function()
        require("onedark").setup({
            style = "deep",
            transparent = true,
            lualine = { transparent = true },
        })
        require("onedark").load()
    end,
}
