vim.pack.add({ { src = "https://github.com/Exafunction/windsurf.nvim" } })

require("codeium").setup({
    enable_cmp_source = false, -- disable cmp requirement
    virtual_text = {
        enabled = true,
        key_bindings = {
            accept = "<M-y>",
            next = "<M-.>",
            prev = "<M-,>",
        }
    }
})
