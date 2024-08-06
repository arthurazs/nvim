return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "akinsho/bufferline.nvim",
        "navarasu/onedark.nvim",
    },
    config = function()
        vim.opt.termguicolors = true
        vim.opt.showmode = false
        require("lualine").setup({
            options = {
                theme = "onedark",
                globalstatus = true,
                always_divide_middle = false,
            },
            sections = {
                lualine_c = { "windows", "selectioncount" },
                lualine_x = { "searchcount", "encoding", "fileformat", "filetype" },
            },
        })
        require("bufferline").setup({
            options = {
                always_show_bufferline = true,
                diagnostics = "nvim_lsp",
            },
        })
    end,
}
