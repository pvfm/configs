return {
  "nvim-neotest/neotest",
  lazy = true,
  dependencies = {
    'olimorris/neotest-rspec',
    'nvim-neotest/neotest-jest',
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require('neotest-rspec')({
          irspec_cmd = function()
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
      config = {
        output_panel = { open_on_run = true },
        diagnostic = true
      }
    })
  end
}

