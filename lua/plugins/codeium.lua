return {
  "Exafunction/codeium.nvim",
  event = "BufEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  opts = {
    -- enable_cmp_source = false,
    virtual_text = {
      enabled = true,
      manual = false,
      key_bindings = {
        accept = "<A-y>",
        accept_word = false,
        accept_line = false,
        next = "<A-.>",
        prev = "<A-,>",
        dismiss = "<A-c>",
      }
    }
  }
}
