return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.opt.termguicolors = true
        require("nvim-tree").setup({
            actions = { open_file = { quit_on_open = true } },
            filters = { dotfiles = true }
        })
    end,
    keys = {
        { "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Toggl[e] nvim tree" }
    }
}
