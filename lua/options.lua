local opt = vim.opt
local tab_width = 4

opt.cursorline = true

opt.expandtab = true
opt.smartindent = true
opt.shiftwidth = tab_width
opt.tabstop = tab_width
opt.softtabstop = tab_width

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"

opt.scrolloff = 5

opt.cmdheight = 0

opt.wrap = false
opt.list = true
opt.listchars = {
    extends = "→",
    precedes = "←",
    tab = "» ",
    trail = "•",
    eol = "↲",
    nbsp = "␣"
}
opt.whichwrap:append "<>hl"

opt.undofile = true
