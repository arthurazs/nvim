vim.pack.add({ { src = "https://github.com/rcarriga/nvim-notify" } })

local notify = require("notify")
notify.setup({ background_colour = "#000000", stages = "fade" })
vim.notify = notify
