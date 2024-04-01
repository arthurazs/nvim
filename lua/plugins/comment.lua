-- keybinds https://github.com/numToStr/Comment.nvim?tab=readme-ov-file#-usage
vim.keymap.set("n", "g/", "<Plug>(comment_toggle_linewise_current)", { desc = "Indent visual selection" })

return { 'numToStr/Comment.nvim', opts = {}, lazy = false }
