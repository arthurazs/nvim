vim.pack.add({ { src = "https://github.com/neovim/nvim-lspconfig" } })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }

local servers = {
    pyright = {
        on_attach = function(client)
            -- disabling pyright formatting to let Ruff handle it
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
        end,
        settings = {
            -- disabling imports and diagnostics, in favor of ruff
            pyright = { disableOrganizeImports = true },
            python = { analysis = { ignore = { '*' }, typeCheckingMode = "standard" } },
        }
    },
    ruff = {
        on_attach = function(client)
            -- disabling hover, in favor of pyright
            client.server_capabilities.hoverProvider = false
        end,
    },
    lua_ls = { settings = { Lua = { diagnostics = { globals = { "vim" } } } } },
    clangd = {},
    pyrefly = {},
    ty = {},
}

for name, config in pairs(servers) do
    config.capabilities = config.capabilities or capabilities
    vim.lsp.config(name, config)
end

vim.lsp.enable(vim.tbl_keys(servers))


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
