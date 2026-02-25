return {
  "nvim-neotest/neotest",
  lazy = true,
  dependencies = {
    'olimorris/neotest-rspec',
    'nvim-neotest/neotest-jest',
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require('neotest-rspec')({
          rspec_cmd = function()
            return vim.tbl_flatten({
              "bundle",
              "exec",
              "rspec",
            })
          end,
        }),
        require('neotest-jest')({
          jestCommand = "npm run test",
          jestConfigFile = "jest.config.ts",
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        }),
      },
      output = {
        open_on_run = true,
      },
      summary = {
        open_on_run = true,
      },
    })
  end
}
