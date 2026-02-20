vim.g.mapleader = " "

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
opt.sidescrolloff = 2

opt.showmode = false
-- opt.cmdheight = 0

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

opt.splitright = true
opt.splitbelow = true

opt.termguicolors = true

-- Spelling
opt.spelllang = { 'en_gb', 'pt_br' }
opt.spell = true

-- Folding
opt.foldcolumn = "auto"
opt.foldlevel = 99 -- Start with all folds open
opt.foldlevelstart = 99
opt.foldenable = true
opt.foldtext = ""
