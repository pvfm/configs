return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    animation = false,
    auto_hide = false,
    tabpages = true,
    clickable = true,
    focus_on_close = "left",
    highlight_alternate = false,
    highlight_inactive_file_icons = false,
    highlight_visible = true,
    icons = {
      buffer_index = false,
      button = "✕",
      diagnostics = {
        [vim.diagnostic.severity.ERROR] = { enabled = true, icon = "E" },
        [vim.diagnostic.severity.WARN] = { enabled = true, icon = "W" },
        [vim.diagnostic.severity.INFO] = { enabled = false },
        [vim.diagnostic.severity.HINT] = { enabled = false },
      },
      gitsigns = {
        added = { enabled = true, icon = "+" },
        changed = { enabled = true, icon = "~" },
        deleted = { enabled = true, icon = "-" },
      },
      filetype = {
        custom_colors = false,
        enabled = true,
      },
      modified = { button = "●" },
      pinned = { button = "", filename = true },
      alternate = { filetype = { enabled = false } },
      visibility = {
        focused = {},
        inactive = {},
      },
    },
    insert_at_start = false,
    maximum_padding = 2,
    maximum_length = 30,
    minimum_padding = 1,
    minimum_length = 0,
    no_name_title = nil,
    semantic_letters = true,
    sidebar_filetypes = {
      NvimTree = true,
    },
  },
}
