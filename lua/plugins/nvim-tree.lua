vim.pack.add({ { src = "https://github.com/nvim-tree/nvim-tree.lua" } })
require('nvim-tree').setup()
require("which-key").add({ { "<leader>e", ":NvimTreeToggle<CR>", desc = "Toggle Fil[e] Explorer", icon = "󰈔" } })
