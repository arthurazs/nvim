return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    priority=999,
    -- dependencies = { "jrudess/vim-foldtext" },
    build = ":TSUpdate",
    opts = {
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
    },
    config = function(_, opts)
        local opt = vim.opt
        -- local g = vim.g
        require("nvim-treesitter.configs").setup(opts)

        -- folding
        opt.foldcolumn = "auto"
        opt.foldmethod = 'expr'
        opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        opt.foldtext = ''
        -- opt.foldnestmax = 4
        -- opt.foldlevelstart = 2
        opt.foldlevel = 99
        -- g.FoldText_info = false -- vim-foldtext
    end,
}
