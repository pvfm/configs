-- Move between split windows
--
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })
-- Create new tab command
--
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "Create a new tab" })

-- Telescope commands
vim.keymap.set('n', '<leader>ff', ":Telescope find_files<CR>", { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>gr', ":Telescope live_grep<CR>", { desc = 'Telescope live grep' })
--vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


-- Git Blame
--
vim.keymap.set('n', '<leader>bl', ":BlameToggle<CR>", { desc = 'Open window with git blame' })


-- Neotree commands
--
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Open Neo Tree' })


-- Disable arrow keys in normal, insert, and visual modes
--
-- Normal mode
vim.keymap.set("n", "<Up>", "<NOP>", { noremap = true, silent = true })
vim.keymap.set("n", "<Down>", "<NOP>", { noremap = true, silent = true })
vim.keymap.set("n", "<Left>", "<NOP>", { noremap = true, silent = true })
vim.keymap.set("n", "<Right>", "<NOP>", { noremap = true, silent = true })

-- Insert mode
vim.keymap.set("i", "<Up>", "<NOP>", { noremap = true, silent = true })
vim.keymap.set("i", "<Down>", "<NOP>", { noremap = true, silent = true })
vim.keymap.set("i", "<Left>", "<NOP>", { noremap = true, silent = true })
vim.keymap.set("i", "<Right>", "<NOP>", { noremap = true, silent = true })

-- Visual mode
vim.keymap.set("v", "<Up>", "<NOP>", { noremap = true, silent = true })
vim.keymap.set("v", "<Down>", "<NOP>", { noremap = true, silent = true })
vim.keymap.set("v", "<Left>", "<NOP>", { noremap = true, silent = true })
vim.keymap.set("v", "<Right>", "<NOP>", { noremap = true, silent = true })


-- Tabline Commands
--
-- Move to previous/next
vim.keymap.set('n', '<leader>.>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })

-- Re-order to previous/next
vim.keymap.set('n', '<leader><>', '<Cmd>BufferMovePrevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>>>', '<Cmd>BufferMoveNext<CR>', { noremap = true, silent = true })

-- Goto buffer in position...
vim.keymap.set('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>0', '<Cmd>BufferLast<CR>', { noremap = true, silent = true })

-- Pin/unpin buffer
vim.keymap.set('n', '<leader>p>', '<Cmd>BufferPin<CR>', { noremap = true, silent = true })

-- Goto pinned/unpinned buffer
--                 :BufferGotoPinned
--                 :BufferGotoUnpinned

-- Close buffer
vim.keymap.set('n', '<leader>c>', '<Cmd>BufferClose<CR>', { noremap = true, silent = true })

-- Wipeout buffer
--                 :BufferWipeout

-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight

-- Magic buffer-picking mode
vim.keymap.set('n', '<C-p>', '<Cmd>BufferPick<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-s-p>', '<Cmd>BufferPickDelete<CR>', { noremap = true, silent = true })


-- Neotest Commands
--
-- Run rspec ruby project
vim.api.nvim_set_keymap("n", "<leader>rs", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", { noremap = true, silent = true })
-- Show Test Result
vim.api.nvim_set_keymap("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<CR>", { noremap = true, silent = true })
-- Window with error
vim.api.nvim_set_keymap("n", "<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>tw", "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch' })<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>tl", "<cmd>lua require('neotest').run.run()<CR>", { noremap = true, silent = true })
