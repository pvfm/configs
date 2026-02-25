return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    win = {
      border = "rounded",
    },
    delay = 400, -- ms após pressionar <leader> para o popup aparecer
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- Registrar grupos de prefixos
    wk.add({
      { "<leader>b",  group = "Buffers" },
      { "<leader>f",  group = "Find (Telescope)" },
      { "<leader>g",  group = "Git (neogit + gitsigns)" },
      { "<leader>l",  group = "LSP" },
      { "<leader>n",  group = "Neotest" },
      { "<leader>s",  group = "Splits" },
      { "<leader>t",  group = "Terminal / Tab" },
      { "<leader>q",  group = "Quit" },
      { "<leader>w",  group = "Write (salvar)" },
      { "<leader>e",  group = "Explorer" },
    })
  end,
}
