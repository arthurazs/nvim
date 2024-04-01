return {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>tg", "<cmd>Telescope live_grep<cr>", desc = "Grep Files" },
    { "<leader>tb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
  },
}
