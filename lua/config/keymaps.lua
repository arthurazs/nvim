vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>", { desc = "Clear highlights" })

-- indent
vim.keymap.set("v", "<", "<gv", { desc = "Indent visual selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Dedent visual selection" })

-- term
vim.keymap.set("t", "<C-x>", "<C-\\><C-n>", { desc = "[Esc]ape back to normal mode" })
