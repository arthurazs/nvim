vim.g.mapleader = " "
vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>", { desc = "Clear highlights" })

-- indent
vim.keymap.set("v", "<", "<gv", { desc = "Indent visual selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Dedent visual selection" })

-- bufferline
vim.keymap.set("n", "<Tab>", "<cmd>bn<cr>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bp<cr>", { desc = "Go to previous buffer" })
vim.keymap.set("n", "gn", "<cmd>bn<cr>", { desc = "[g]o to [n]ext buffer" })
vim.keymap.set("n", "gp", "<cmd>bp<cr>", { desc = "[g]o to [p]revious buffer" })
vim.keymap.set("n", "gx", "<cmd>bd<cr>", { desc = "[g]o and e[x]clude current buffer" })

-- term
vim.keymap.set("t", "<C-x>", "<C-\\><C-n>", { desc = "[Esc]ape back to normal mode" })
vim.keymap.set("n", "<leader>n", "<C-w>s<bar><C-w>j<bar><cmd>term<cr>", { desc = "Open [n]ew terminal" })

-- window
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Move to the left window" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Move to the top window" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Move to the bottom window" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Move to the right window" })
