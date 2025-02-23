local treesitter = {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  priority = 999,
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
    opt.foldmethod = "expr"
    opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    opt.foldtext = ""
    -- opt.foldnestmax = 4
    -- opt.foldlevelstart = 2
    opt.foldlevel = 99
    -- g.FoldText_info = false -- vim-foldtext
  end,
}

local markdown = {
  "MeanderingProgrammer/markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  ft = "markdown",
  opts = {}
}

local markview = {
  "OXY2DEV/markview.nvim",
  lazy = false,
}

local lint = {
  -- Do I need this?
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint");
    lint.linters_by_ft = {
      python = { "mypy" }
    }
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end
    })
    vim.keymap.set("n", "<leader>ll", function()
      lint.try_lint()
    end, { desc = "[L]int" })
  end
}

return { treesitter, markdown }
