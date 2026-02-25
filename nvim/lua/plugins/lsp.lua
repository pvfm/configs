return {
  -- Mason: gerenciador de LSP servers, linters e formatters
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  -- Bridge entre Mason e LSP nativo do Neovim 0.11+
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "ruby_lsp",   -- Ruby / Rails
        "ts_ls",      -- TypeScript / JavaScript
        "vue_ls",     -- Vue (Volar v2, hybrid mode com ts_ls)
        "gopls",      -- Go
        "lua_ls",     -- Lua (config do nvim)
        "html",       -- HTML
        "cssls",      -- CSS / SCSS
        "jsonls",     -- JSON
        "yamlls",     -- YAML
      },
      automatic_enable = true,
    },
  },

  -- nvim-lspconfig: biblioteca de configs dos servidores
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      -- ruby-lsp: usar o shim do asdf para que a versão correta do Ruby seja usada
      -- por projeto (.ruby-version / .tool-versions), em vez do binário hardcoded do Mason.
      -- ruby-lsp já está instalado para Ruby 3.1.2, 3.1.6 e 3.4.4.
      vim.lsp.config("ruby_lsp", {
        cmd = { vim.fn.expand("$HOME/.asdf/shims/ruby-lsp") },
      })

      -- rubocop: wrapper que usa bundle exec se bundle estiver OK, senão cai para o Mason rubocop.
      -- Evita erro de gem não encontrada (ex: rubocop-rails-omakase) e bundle quebrado.
      vim.lsp.config("rubocop", {
        cmd = { vim.fn.expand("$HOME/.local/bin/rubocop-lsp-wrapper") },
      })

      -- Volar v2 (hybrid mode): ts_ls cuida do TypeScript via plugin @vue,
      -- Volar cuida apenas das features Vue-específicas (template, SFC, etc.)
      local vue_plugin_path = vim.fn.expand(
        "$HOME/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/typescript-plugin"
      )

      vim.lsp.config("ts_ls", {
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = vue_plugin_path,
              languages = { "vue" },
            },
          },
        },
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      })

      vim.lsp.config("volar", {
        filetypes = { "vue" },
      })

      -- Diagnósticos
      vim.diagnostic.config({
        virtual_text = { prefix = "●" },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = "󰠠 ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = { border = "rounded", source = true },
      })

      -- Keymaps LSP definidos em lua/core/keymaps.lua via LspAttach
    end,
  },

  -- lazydev: substituto do neodev (depreciado) para Lua LSP no nvim
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
}
