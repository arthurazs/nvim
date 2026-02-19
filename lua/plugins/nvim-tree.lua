vim.pack.add({ { src = "https://github.com/nvim-tree/nvim-tree.lua" } })
require("nvim-tree").setup({
    actions = { open_file = { quit_on_open = true } },
    filters = { dotfiles = true },
})
require("which-key").add({
  { "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Toggl[e] File Explorer", icon = "󰈔" }
})
