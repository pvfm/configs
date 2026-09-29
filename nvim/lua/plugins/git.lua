return {
  -- Neogit: interface Git completa dentro do nvim
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",  -- carrega só ao abrir o painel
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    config = function()
      require("neogit").setup({
        graph_style = "unicode",
        integrations = {
          diffview = true,
        },
      })
    end,
  },

  -- Gitsigns: indicadores de mudanca na coluna lateral + acoes por hunk
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add          = { text = "▎" }, -- linha nova
        change       = { text = "▎" }, -- linha modificada
        delete       = { text = "" }, -- linha removida
        topdelete    = { text = "" }, -- inicio de bloco removido
        changedelete = { text = "▎" }, -- modificada e removida
      },
      current_line_blame = false, -- blame inline (toggle via keymap)
    },
  },
}
