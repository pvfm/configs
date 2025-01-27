local let opt = vim.opt

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
