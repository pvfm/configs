return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        go   = { "goimports" },
        ["*"] = { "trim_whitespace" },
      },
      -- Ao salvar: apenas trim_whitespace
      -- Linters/formatters de linguagem só rodam via <leader>lf
      format_on_save = function()
        return { formatters = { "trim_whitespace" }, timeout_ms = 500 }
      end,
    })
  end,
}
