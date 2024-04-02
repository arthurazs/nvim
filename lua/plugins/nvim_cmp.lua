vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'
vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
vim.g.UltiSnipsListSnippets = '<c-q>'
vim.g.UltiSnipsJumpForwardTrigger="<c-b>"
-- vim.g.UltiSnipsJumpForwardTrigger="<c-n>"
-- vim.g.UltiSnipsJumpBackwardTrigger="<c-p>"
vim.g.UltiSnipsJumpBackwardTrigger="<c-z>"
vim.g.UltiSnipsRemoveSelectModeMappings = 0


return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"onsails/lspkind.nvim", -- icons
		-- snippet
		"SirVer/ultisnips",
		"quangnguyen30192/cmp-nvim-ultisnips",
		"honza/vim-snippets",
		-- "L3MON4D3/LuaSnip",
		-- "saadparwaiz1/cmp_luasnip",
		-- "hrsh7th/cmp-vsnip",
		-- "hrsh7th/vim-vsnip",
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		cmp.setup({
			formatting = { format = lspkind.cmp_format() },
			mapping = cmp.mapping.preset.insert({
				-- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
				-- ["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-o>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				-- ["Up"] = cmp.config.disable,  -- not working
				-- ["Down"] = cmp.config.disable,
			}),
			snippet = {
				expand = function(args)
					vim.fn["UltiSnips#Anon"](args.body)
					-- require('luasnip').lsp_expand(args.body)
					-- require('snippy').expand_snippet(args.body)
					-- vim.fn["vsnip#anonymous"](args.body)
				end
			},
			sources = cmp.config.sources(
				{
					{ name = "nvim_lsp" },
					-- snippet
					{ name = "ultisnips" },
					-- { name = 'luasnip' }
					-- { name = 'snippy' },
					-- { name = 'vsnip' },
				},
				{ { name = "buffer" } }
			)
		})
		-- Use buffer source for `/`.
		cmp.setup.cmdline('/', {
			completion = { autocomplete = false },
			sources = {
				-- { name = 'buffer' }

				{ name = 'buffer', opts = { keyword_pattern = [=[[^[:blank:]].*]=] } }
			}
		})

		-- Use cmdline & path source for ':'.
		cmp.setup.cmdline(':', {
			completion = { autocomplete = false },
			sources = cmp.config.sources({
				{ name = 'path' }
			}, {
				{ name = 'cmdline' }
			})
		})
	end
}
