vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>", { desc = "Clear highlights" })

-- indent
vim.keymap.set("v", "<", "<gv", { desc = "Indent visual selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Dedent visual selection" })

-- buffers
vim.keymap.set("n", "<Tab>", "<cmd>bn<cr>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bp<cr>", { desc = "Go to previous buffer" })

-- term
vim.keymap.set("t", "<C-x>", "<C-\\><C-n>", { desc = "[Esc]ape back to normal mode" })
