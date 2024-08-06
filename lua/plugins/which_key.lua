return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
        require('which-key').add({
            { '<leader>x', group = 'e[x]tras' },
            { "<leader>t", group = "[t]elescope" },
            { "<leader>l", group = "[l]sp" },
        })
    end
}
