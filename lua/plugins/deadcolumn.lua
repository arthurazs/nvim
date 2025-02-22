return {
  "Bekaboo/deadcolumn.nvim",
  event = "InsertEnter",
  config = function()
    vim.opt.colorcolumn = "120"
    vim.opt.termguicolors = true
  end
}
