return {
    "MeanderingProgrammer/markdown.nvim",
    enabled = false,
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = "markdown",
    config = function()
        require("render-markdown").setup({})
    end,
}
