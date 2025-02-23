local onedark = {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "echasnovski/mini.icons",
  },
  opts = {
    style = "deep",
    transparent = true,
    lualine = { transparent = true },
    toggle_style_key = "<leader>o",
    toggle_style_list = { "light", "deep" },
  },
  config = function(_, opts)
    require("onedark").setup(opts)
    require("onedark").load()
  end,
}

local illuminate = {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
}

local deadcolumn = {
  "Bekaboo/deadcolumn.nvim",
  event = "InsertEnter",
  config = function() vim.opt.colorcolumn = "120" end
}

local whitespace = {
  "mcauley-penney/visual-whitespace.nvim",
  event = "ModeChanged *:[vV\x16]*", -- This is currently bugged
  opts = {},
}

local winsep = {
  "nvim-zh/colorful-winsep.nvim",
  event = "WinLeave",
  opts = {}
}

return { onedark, illuminate, deadcolumn, whitespace, winsep }
