vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
})

local fzf_path = vim.fn.stdpath("data") .. "/site/pack/core/opt/telescope-fzf-native.nvim"
local fzf_binary = fzf_path .. "/build/libfzf.so"

if vim.fn.filereadable(fzf_binary) == 0 then
    local build_msg = vim.notify("Building telescope-fzf-native...", vim.log.levels.WARN, {
        title = "Plugin Setup",
        icon = "",
    })

    vim.defer_fn(function()
        vim.system({ "make", "-C", fzf_path }, { text = true }, function(obj)
            vim.schedule(function()
                if obj.code == 0 then
                    vim.notify("fzf-native built successfully!", vim.log.levels.INFO, {
                        title = "Plugin Setup",
                        icon = "󰄲",
                        replace = build_msg, -- Transform the old notification into this one
                    })
                    -- 3. Load the extension only after it"s actually built
                    pcall(require("telescope").load_extension, "fzf")
                else
                    vim.notify("Build failed: " .. (obj.stderr or "Check your logs"), vim.log.levels.ERROR, {
                        title = "Build Error"
                    })
                end
            end)
        end)
    end, 100)
else
    -- If it"s already built, just load it normally
    pcall(require("telescope").load_extension, "fzf")
end

vim.keymap.set("n", "<leader>tf", "<cmd>Telescope find_files<cr>", { desc = "[F]ind Files" })
vim.keymap.set("n", "<leader>tg", "<cmd>Telescope live_grep<cr>", { desc = "[G]rep Files" })
vim.keymap.set("n", "<leader>tb", "<cmd>Telescope buffers<cr>", { desc = "Find [B]uffers" })

-- Extra
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>xh", builtin.help_tags, { desc = "e[x]tra search [h]elp" })
vim.keymap.set("n", "<leader>xk", builtin.keymaps, { desc = "e[x]tra search [k]eymaps" })
vim.keymap.set("n", "<leader>xf", builtin.find_files, { desc = "e[x]tra search [f]iles" })
vim.keymap.set("n", "<leader>xs", builtin.builtin, { desc = "e[x]tra search [s]elect Telescope" })
vim.keymap.set("n", "<leader>xw", builtin.grep_string, { desc = "e[x]tra search current [w]ord" })
vim.keymap.set("n", "<leader>xg", builtin.live_grep, { desc = "e[x]tra search by [g]rep" })
vim.keymap.set("n", "<leader>xd", builtin.diagnostics, { desc = "e[x]tra search [d]iagnostics" })
vim.keymap.set("n", "<leader>xr", builtin.resume, { desc = "e[x]tra search [r]esume" })
vim.keymap.set("n", "<leader>x.", builtin.oldfiles, { desc = 'e[x]tra search Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader>x<leader>", builtin.buffers, { desc = "e[x]tra [ ] Find existing buffers" })
