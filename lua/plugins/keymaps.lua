local which_key = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("which-key").add({
      { "<leader>x", group = "e[x]tras" },
      { "<leader>t", group = "[t]elescope" },
      { "<leader>l", group = "[l]sp" },
    })
  end
}

local leap = {
  "ggandor/leap.nvim",
  keys = { { "gs", "<Plug>(leap-anywhere)", desc = "Leap anywhere" } },
}

return { which_key, leap }
