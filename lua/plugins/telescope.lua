return {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    branch = "0.1.x",
    dependencies = {
        'nvim-lua/plenary.nvim',
        "nvim-treesitter/nvim-treesitter",
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
        'nvim-telescope/telescope-ui-select.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")
        local themes = require("telescope.themes")
        telescope.setup {
            pickers = {},
            extensions = { ['ui-select'] = { themes.get_dropdown() } },
        }
        pcall(telescope.load_extension, 'fzf')
        pcall(telescope.load_extension, 'ui-select')
        vim.keymap.set('n', '<leader>xh', builtin.help_tags, { desc = '[S]earch [H]elp' })
        vim.keymap.set('n', '<leader>xk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
        vim.keymap.set('n', '<leader>xf', builtin.find_files, { desc = '[S]earch [F]iles' })
        vim.keymap.set('n', '<leader>xs', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
        vim.keymap.set('n', '<leader>xw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
        vim.keymap.set('n', '<leader>xg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
        vim.keymap.set('n', '<leader>xd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
        vim.keymap.set('n', '<leader>xr', builtin.resume, { desc = '[S]earch [R]esume' })
        vim.keymap.set('n', '<leader>x.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
        vim.keymap.set('n', '<leader>x<leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

        vim.keymap.set('n', '<leader>xc', function()
            builtin.current_buffer_fuzzy_find(themes.get_dropdown { previewer = false })
        end, { desc = '[/] Fuzzily search in current buffer' })

        vim.keymap.set('n', '<leader>x/', function()
            builtin.live_grep {
                grep_open_files = true,
                prompt_title = 'Live Grep in Open Files',
            }
        end, { desc = '[S]earch [/] in Open Files' })

        vim.keymap.set('n', '<leader>xn', function()
            builtin.find_files { cwd = vim.fn.stdpath 'config' }
        end, { desc = '[S]earch [N]eovim files' })
    end,
    keys = {
        { "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "[F]ind Files" },
        { "<leader>tg", "<cmd>Telescope live_grep<cr>",  desc = "[G]rep Files" },
        { "<leader>tb", "<cmd>Telescope buffers<cr>",    desc = "Find [B]uffers" },
    },
}
