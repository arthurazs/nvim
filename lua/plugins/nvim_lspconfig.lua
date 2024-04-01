return {
	"neovim/nvim-lspconfig",
	config = function()
		local lsp = require("lspconfig")
		lsp.pyright.setup({})
		lsp.ruff_lsp.setup({})
		lsp.lua_ls.setup({ settings = { Lua = { diagnostics = { globals = { "vim" } } } } })

		vim.keymap.set("n", "<leader>lk", vim.diagnostic.open_float, { desc = "Floating Diagnostic" })
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Got to next diagnostic" })
		vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
		vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next, { desc = "Got to next diagnostic" })
		vim.keymap.set("n", "<leader>ll", vim.diagnostic.setloclist, { desc = "List Diagnostic" })

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set(
					"n", "<leader>lD", vim.lsp.buf.declaration,
					vim.tbl_extend("force", opts, { desc = "Go to Declaration" }))
				vim.keymap.set(
					"n", "gd", vim.lsp.buf.definition,
					vim.tbl_extend("force", opts, { desc = "Go to Definition" }))
				vim.keymap.set(
					"n", "<leader>lg", vim.lsp.buf.definition,
					vim.tbl_extend("force", opts, { desc = "Go to Definition" }))
				vim.keymap.set(
					"n", "<leader>lK", vim.lsp.buf.hover,
					vim.tbl_extend("force", opts, { desc = "Hover" }))
				vim.keymap.set(
					"n", "<leader>li", vim.lsp.buf.implementation,
					vim.tbl_extend("force", opts, { desc = "Go to Implementation" }))
				vim.keymap.set(
					"n", "<leader>lh", vim.lsp.buf.signature_help,
					vim.tbl_extend("force", opts, { desc = "Signature Help" }))
				vim.keymap.set(
					"n", "<leader>lt", vim.lsp.buf.type_definition,
					vim.tbl_extend("force", opts, { desc = "Type Definition" }))
				vim.keymap.set(
					"n", "<leader>lr", vim.lsp.buf.rename,
					vim.tbl_extend("force", opts, { desc = "Rename" }))
				vim.keymap.set(
					{ "n", "v" }, "<leader>la", vim.lsp.buf.code_action,
					vim.tbl_extend("force", opts, { desc = "Code Action" }))
				vim.keymap.set(
					"n", "<leader>lR", vim.lsp.buf.references,
					vim.tbl_extend("force", opts, { desc = "References" }))
				vim.keymap.set(
					"n", "<leader>lf", function() vim.lsp.buf.format { async = true } end,
					vim.tbl_extend("force", opts, { desc = "Format" }))
			end,
		})
	end,
}
