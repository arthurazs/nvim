local bufferline = {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      always_show_bufferline = false,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(_, _, diag)
        return vim.trim(
          (diag.error   and "⛔" .. diag.error   .. " " or "") ..
          (diag.warning and "󰀪 " .. diag.warning .. " " or "") ..
          (diag.hint    and "󰌶 " .. diag.hint    .. " " or "") ..
          (diag.info    and " " .. diag.info           or "")
        )
      end,
      offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center", separator = true } },
      show_close_icon = false,
      show_buffer_close_icons = false,
    }
  }
}

local dropbar = {
  "Bekaboo/dropbar.nvim",
  dependencies = { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  config = function()
    local dropbar_api = require("dropbar.api")
    vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
    vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
    vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
  end,
}

local lualine = {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "navarasu/onedark.nvim",
    "Exafunction/codeium.nvim",
  },
  opts = {
    options = {
      theme = "onedark",
      globalstatus = true,
      always_divide_middle = false,
    },
    -- tabline = { lualine_b = { "buffers" }, lualine_y = { "windows" }, lualine_z = { "tabs" } },
    -- winbar = { lualine_a = {} },
    sections = {
      lualine_c = {
        function()
          return "󰘦 " .. require("codeium.virtual_text").status_string()
        end,
        "selectioncount",
      },
      lualine_x = { "searchcount", "encoding", "fileformat", "filetype" },
    },
  },
}

local fidget = {
  "j-hui/fidget.nvim",
  event = "VeryLazy",
  opts = {
    notification = { window = { winblend = 0 } },
    -- integration = { ["nvim-tree"] = { enable = false } }
  },
}

return { dropbar, bufferline, lualine, fidget }
