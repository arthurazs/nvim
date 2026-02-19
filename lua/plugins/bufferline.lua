vim.pack.add({ { src = "https://github.com/akinsho/bufferline.nvim" } })

require("bufferline").setup({
    options = {
        always_show_bufferline = false,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(_, _, diag)
            return vim.trim(
                (diag.error and "⛔" .. diag.error .. " " or "") ..
                (diag.warning and "󰀪 " .. diag.warning .. " " or "") ..
                (diag.hint and "󰌶 " .. diag.hint .. " " or "") ..
                (diag.info and " " .. diag.info or "")
            )
        end,
        offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center", separator = true } },
        show_close_icon = false,
        show_buffer_close_icons = false,
    }
})
