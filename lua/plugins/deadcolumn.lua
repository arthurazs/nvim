return {
    "Bekaboo/deadcolumn.nvim",
    event = "InsertEnter",
    config = function()
        local opt = vim.opt
        opt.colorcolumn = "120"
        opt.termguicolors = true
    end
}
