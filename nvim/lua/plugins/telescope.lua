return {
  'nvim-telescope/telescope.nvim', branch = 'master',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup({
      defaults = {
        -- Corrige cursor voltando ao início ao digitar no prompt
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        -- Garante que o prompt começa em insert mode
        initial_mode = "insert",
        -- Evita conflito com guicursor block em insert mode
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        -- Mostrar arquivos ocultos no live_grep
        vimgrep_arguments = {
          "rg", "--color=never", "--no-heading", "--with-filename",
          "--line-number", "--column", "--smart-case", "--hidden",
          "--glob", "!**/.git/*",
        },
      },
      pickers = {
        -- Mostrar arquivos ocultos no find_files (ex: .env, .gitignore)
        find_files = {
          hidden = true,
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
      },
    })
  end,
}
