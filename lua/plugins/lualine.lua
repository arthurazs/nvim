vim.pack.add({ { src = "https://github.com/nvim-lualine/lualine.nvim" } })

require("lualine").setup({
    options = {
        theme = "onedark",
        globalstatus = true,
        always_divide_middle = false,
    },
    tabline = { lualine_b = { "buffers" }, lualine_y = { "windows" }, lualine_z = { "tabs" } },
    -- winbar = { lualine_a = {} },
    sections = {
        lualine_c = {
            function()
                return "󰘦 " .. require("codeium.virtual_text").status_string()
            end,
            "selectioncount",
        },
        lualine_x = { "searchcount", "encoding", "fileformat", "filetype" },
    }
})
