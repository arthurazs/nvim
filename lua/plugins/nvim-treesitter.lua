vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter" } })

local ts = require("nvim-treesitter")
ts.install({
    "bash", "c", "cmake", "css", "csv", "desktop", "diff", "git_config", "gitignore", "go", "html", "html_tags",
    "javascript", "json", "lua", "make", "markdown", "python", "regex", "rust", "toml", "xml", "yaml"
}, { summary = true })

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("treesitter_setup", { clear = true }),
    pattern = { "*" },
    callback = function(event)
        pcall(vim.treesitter.start, event.buf)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})
