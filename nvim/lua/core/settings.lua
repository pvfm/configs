local opt = vim.opt

opt.mouse = ""

opt.guicursor = "n-v-i-c:block-Cursor"

opt.cursorline = true
opt.number = true
opt.termguicolors = true

-- Use 2 spaces for tabs
opt.tabstop = 2       -- Number of spaces a tab counts for
opt.shiftwidth = 2    -- Number of spaces to use for autoindent
opt.expandtab = true  -- Convert tabs to spaces
opt.smarttab = true   -- Make tabs smarter (e.g., respect `shiftwidth`)

vim.g.mapleader = " "
vim.g.maplocalleader = " " -- Optional for local leader

opt.ignorecase = true  -- busca case-insensitive por padrão
opt.smartcase = true   -- mas se digitar letra maiúscula, vira case-sensitive

opt.scrolloff = 8
opt.sidescrolloff = 8

opt.undofile = true

opt.clipboard = "unnamedplus"

opt.fixendofline = true  -- garante newline no final do arquivo ao salvar

-- Auto-reload files changed externally (ex: Claude Code no terminal)
opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "WinEnter", "TermLeave", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("silent! checktime")
    end
  end,
})
