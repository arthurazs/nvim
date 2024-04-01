vim.g.coq_settings = { auto_start = "shut-up" }

return {
	"ms-jpq/coq_nvim",
	branch = "coq",
	dependencies = { "ms-jpq/coq.artifacts" },
	config = function()
		local lsp = require("lspconfig")
		local coq = require("coq")
		lsp.lua_ls.setup(coq.lsp_ensure_capabilities())
		lsp.pyright.setup(coq.lsp_ensure_capabilities())
	end,
}
