return { -- adapted from nvim-lua/kickstart.nvim
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
            build = (function()
                return "make install_jsregexp"
            end)(),
            dependencies = {
                {
                    "rafamadriz/friendly-snippets",
                    config = function()
                        require("luasnip.loaders.from_vscode").lazy_load()
                    end,
                },
            },
        },
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "onsails/lspkind.nvim"
    },
    config = function()
        local cmp = require "cmp"
        local luasnip = require "luasnip"
        local lspkind = require "lspkind"
        luasnip.config.setup {}

        cmp.setup {
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol",
                    maxwidth = 50,
                    ellipsis_char = "...",
                    show_labelDetails = true,
                    before = function(entry, vim_item)
                        return vim_item
                    end
                })
            },
            experimental = {
                ghost_text = true
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            completion = { completeopt = "menu,menuone,popup,noinsert" },

            mapping = cmp.mapping.preset.insert {
                ["<A-n>"] = cmp.mapping.select_next_item(),
                ["<A-p>"] = cmp.mapping.select_prev_item(),

                -- Scroll the documentation window [b]ack / [f]orward
                ["<A-b>"] = cmp.mapping.scroll_docs(-4),
                ["<A-f>"] = cmp.mapping.scroll_docs(4),

                ["<C-y>"] = cmp.mapping.confirm { select = true },

                -- Manually trigger a completion from nvim-cmp.
                ["<C-n>"] = cmp.mapping.complete {},

                -- Snippet expansion motions.
                ["<C-l>"] = cmp.mapping(function()
                    if luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    end
                end, { "i", "s" }),
                ["<C-h>"] = cmp.mapping(function()
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end, { "i", "s" }),
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
            },
        }
        vim.cmd(":set winhighlight=" .. cmp.config.window.bordered().winhighlight)
    end,
}
