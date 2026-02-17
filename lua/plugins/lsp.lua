vim.pack.add({ { src = "https://github.com/neovim/nvim-lspconfig" } })

local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config('pyright', { capabilities = capabilities })
vim.lsp.config('lua_ls', {
    capabilities = capabilities,
    settings = { Lua = { diagnostics = { globals = { "vim" } } } }
})
vim.lsp.enable({ "lua_ls", "pyright" })

require("which-key").add({
    { "gr", group = "LSP [g]o [r]equest", icon = "" },
    { "grf", function() vim.lsp.buf.format({ async = true }) end, desc = "Format" },
    {
        "grT",
        function()
            local enabled = not vim.diagnostic.is_enabled()
            vim.diagnostic.enable(enabled)
            vim.notify(
                enabled and "Diagnostics Actived" or "Diagnostics Paused",
                enabled and vim.log.levels.INFO or vim.log.levels.WARN,
                { title = "LSP System", icon = enabled and "󰝖" or "󱖫" }
            )
        end,
        desc = "Toggle LSP"
    }
})
