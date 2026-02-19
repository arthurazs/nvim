vim.api.nvim_create_autocmd({ "LspAttach", "FileType" }, {
    group = vim.api.nvim_create_augroup("folding", { clear = true }),
    callback = function(event)
        local buf = event.buf

        if vim.bo[event.buf].buftype ~= "" then return end

        local max_filesize = 1024 * 1024
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            vim.wo.foldmethod = "indent"
            vim.wo.foldexpr = ""
            return
        end

        vim.schedule(function()
            local clients = vim.lsp.get_clients({ bufnr = buf })
            local lsp_folds = vim.iter(clients):any(function(c)
                return c.server_capabilities.foldingRangeProvider
            end)

            if lsp_folds then
                vim.wo.foldmethod = "expr"
                vim.wo.foldexpr = "v:lua.vim.lsp.foldexpr()"
                return
            end

            local ts_ok = pcall(vim.treesitter.get_parser, buf)
            if ts_ok then
                vim.wo.foldmethod = "expr"
                vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                return
            end

            vim.wo.foldmethod = "indent"
            vim.wo.foldexpr = ""
        end)
    end,
})
