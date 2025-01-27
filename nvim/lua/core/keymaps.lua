-- Add these keymaps to your LazyVim configuration
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "Create a new tab" })

-- Telescope commands
vim.keymap.set('n', '<leader>ff', ":Telescope find_files<CR>", { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>gr', ":Telescope live_grep<CR>", { desc = 'Telescope live grep' })
--vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Neotree commands
vim.keymap.set('n', '<leader>e', ':Neotree<CR>', { desc = 'Open Neo Tree' })

-- Disable arrow keys in normal, insert, and visual modes

-- Normal mode
vim.api.nvim_set_keymap("n", "<Up>", "<NOP>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Down>", "<NOP>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Left>", "<NOP>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Right>", "<NOP>", { noremap = true, silent = true })

-- Insert mode
vim.api.nvim_set_keymap("i", "<Up>", "<NOP>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<Down>", "<NOP>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<Left>", "<NOP>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<Right>", "<NOP>", { noremap = true, silent = true })

-- Visual mode
vim.api.nvim_set_keymap("v", "<Up>", "<NOP>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Down>", "<NOP>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Left>", "<NOP>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Right>", "<NOP>", { noremap = true, silent = true })

