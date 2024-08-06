return {
    "kdheepak/lazygit.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    cmd = {
        "LazyGit",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    keys = {
        { "<leader>g", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit" },
    },
}
