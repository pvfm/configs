-- ─────────────────────────────────────────────────────────────────────────────
-- KEYMAPS
-- Prefixos por ferramenta:
--   <leader>f  → Find / Telescope
--   <leader>g  → Git
--   <leader>l  → LSP
--   <leader>n  → Neotest
--   <leader>s  → Splits
--   <leader>t  → Terminal / Tab
--   <leader>b  → Buffers (barbar)
--   <leader>e  → Explorer (neotree)
--   <leader>w  → Write (salvar)
--   <leader>q  → Quit (fechar)
-- ─────────────────────────────────────────────────────────────────────────────

-- ─────────────────────────────────────────────────────────────────────────────
-- Terminal (toggleterm)
-- ─────────────────────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>",        { desc = "Toggle terminal (split)" })
vim.keymap.set("t", "<Esc>",      "<C-\\><C-n>",                { desc = "Sair do modo terminal → modo normal" })

-- ─────────────────────────────────────────────────────────────────────────────
-- Salvar / Fechar
-- ─────────────────────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>w",  "<cmd>w<CR>",                 { desc = "Salvar arquivo atual" })
vim.keymap.set("n", "<leader>W",  "<cmd>wa<CR>",                { desc = "Salvar todos os arquivos" })
vim.keymap.set("n", "<leader>q",  "<cmd>q<CR>",                 { desc = "Fechar buffer atual" })
vim.keymap.set("n", "<leader>Q",  "<cmd>qa<CR>",                { desc = "Fechar todos os buffers" })
vim.keymap.set("n", "<leader>Q!", "<cmd>qa!<CR>",               { desc = "Forçar fechar tudo (sem salvar)" })

-- ─────────────────────────────────────────────────────────────────────────────
-- Splits — criar e navegar
-- ─────────────────────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>",              { desc = "Split vertical" })
vim.keymap.set("n", "<leader>sh", "<cmd>split<CR>",               { desc = "Split horizontal" })

vim.keymap.set("n", "<C-h>",      "<C-w>h",                      { desc = "Mover para split da esquerda" })
vim.keymap.set("n", "<C-j>",      "<C-w>j",                      { desc = "Mover para split abaixo" })
vim.keymap.set("n", "<C-k>",      "<C-w>k",                      { desc = "Mover para split acima" })
vim.keymap.set("n", "<C-l>",      "<C-w>l",                      { desc = "Mover para split da direita" })

-- Smart resize: a seta indica a direção em que a janela atual expande.
-- Cursor no split de cima  → <C-Up> cresce, <C-Down> encolhe
-- Cursor no split de baixo → <C-Up> encolhe (cede espaço), <C-Down> cresce
local function smart_resize(dir)
  local has_above = vim.fn.winnr("k") ~= vim.fn.winnr()
  local has_left  = vim.fn.winnr("h") ~= vim.fn.winnr()
  if dir == "up" then
    vim.cmd(has_above and "resize -2" or "resize +2")
  elseif dir == "down" then
    vim.cmd(has_above and "resize +2" or "resize -2")
  elseif dir == "left" then
    vim.cmd(has_left and "vertical resize -2" or "vertical resize +2")
  elseif dir == "right" then
    vim.cmd(has_left and "vertical resize +2" or "vertical resize -2")
  end
end

vim.keymap.set("n", "<C-Up>",    function() smart_resize("up") end,    { desc = "Split: expandir para cima" })
vim.keymap.set("n", "<C-Down>",  function() smart_resize("down") end,  { desc = "Split: expandir para baixo" })
vim.keymap.set("n", "<C-Left>",  function() smart_resize("left") end,  { desc = "Split: expandir para esquerda" })
vim.keymap.set("n", "<C-Right>", function() smart_resize("right") end, { desc = "Split: expandir para direita" })
vim.keymap.set("n", "<C-=>",      "<C-w>=",                      { desc = "Igualar tamanho dos splits" })

-- ─────────────────────────────────────────────────────────────────────────────
-- Tabs
-- ─────────────────────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>",              { desc = "Nova aba" })

-- ─────────────────────────────────────────────────────────────────────────────
-- Find — Telescope
-- ─────────────────────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>",  { desc = "Buscar arquivo por nome" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>",   { desc = "Buscar texto em todos os arquivos" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>",     { desc = "Listar buffers abertos" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>",    { desc = "Arquivos recentes" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>",   { desc = "Buscar na documentação do nvim" })
vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<CR>",     { desc = "Listar todos os keymaps" })

-- ─────────────────────────────────────────────────────────────────────────────
-- Git — Neogit + Gitsigns + blame.nvim
-- ─────────────────────────────────────────────────────────────────────────────

-- Neogit: painel principal (stage, commit, push, pull, stash, merge, log...)
vim.keymap.set("n", "<leader>go", "<cmd>Neogit<CR>",                { desc = "Abrir painel Git (neogit)" })

-- Telescope: busca no histórico git
vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Ver histórico de commits" })
vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>",  { desc = "Ver arquivos modificados" })
vim.keymap.set("n", "<leader>gB", "<cmd>Telescope git_branches<CR>",{ desc = "Listar branches" })

-- Blame (blame.nvim — linha por linha em janela separada)
vim.keymap.set("n", "<leader>gb", "<cmd>BlameToggle<CR>",           { desc = "Toggle blame por linha" })

-- Gitsigns: acoes no hunk atual (trecho modificado)
vim.keymap.set("n", "<leader>gp", function() require("gitsigns").preview_hunk() end,  { desc = "Preview do hunk atual" })
vim.keymap.set("n", "<leader>ga", function() require("gitsigns").stage_hunk() end,    { desc = "Stage do hunk atual" })
vim.keymap.set("n", "<leader>gu", function() require("gitsigns").undo_stage_hunk() end, { desc = "Desfazer stage do hunk" })
vim.keymap.set("n", "<leader>gr", function() require("gitsigns").reset_hunk() end,    { desc = "Resetar hunk (descartar mudança)" })
vim.keymap.set("n", "<leader>gi", function() require("gitsigns").toggle_current_line_blame() end, { desc = "Toggle blame inline na linha" })

-- Navegar entre hunks
vim.keymap.set("n", "]h", function() require("gitsigns").next_hunk() end, { desc = "Proximo hunk" })
vim.keymap.set("n", "[h", function() require("gitsigns").prev_hunk() end, { desc = "Hunk anterior" })

-- ─────────────────────────────────────────────────────────────────────────────
-- Explorer — Neo-tree
-- ─────────────────────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>e",  "<cmd>Neotree toggle<CR>",        { desc = "Toggle file explorer" })

-- ─────────────────────────────────────────────────────────────────────────────
-- LSP — ativados automaticamente quando um servidor conecta no buffer
-- ─────────────────────────────────────────────────────────────────────────────
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }
    local map = function(keys, fn, desc)
      vim.keymap.set("n", keys, fn, vim.tbl_extend("force", opts, { desc = desc }))
    end

    -- Navegação (sem leader — padrão universal do nvim)
    map("gd", vim.lsp.buf.definition,     "Ir para definição")
    map("gD", vim.lsp.buf.declaration,    "Ir para declaração")
    map("gr", vim.lsp.buf.references,     "Ver todas as referências")
    map("gi", vim.lsp.buf.implementation, "Ir para implementação")
    map("K",  vim.lsp.buf.hover,          "Documentação do símbolo (hover)")

    -- LSP — prefixo <leader>l
    map("<leader>lr", vim.lsp.buf.rename,        "Renomear símbolo em todo projeto")
    map("<leader>ld", vim.diagnostic.open_float, "Ver detalhe do diagnóstico da linha")
    vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action,
      vim.tbl_extend("force", opts, { desc = "Code actions (fix, import, refactor)" }))

    -- Navegar entre diagnósticos (erros/warnings)
    map("[d", vim.diagnostic.goto_prev, "Diagnostico anterior")
    map("]d", vim.diagnostic.goto_next, "Proximo diagnostico")
  end,
})

-- ─────────────────────────────────────────────────────────────────────────────
-- Neotest — rodar testes
-- ─────────────────────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>nr", function() require('neotest').run.run(vim.fn.expand('%')) end,   { desc = "Rodar testes do arquivo atual" })
vim.keymap.set("n", "<leader>nl", function() require('neotest').run.run() end,                     { desc = "Rodar último teste novamente" })
vim.keymap.set("n", "<leader>ns", function() require('neotest').summary.toggle() end,              { desc = "Toggle painel de resultados" })
vim.keymap.set("n", "<leader>no", function() require('neotest').output.open({ enter = true }) end, { desc = "Abrir output do teste" })
vim.keymap.set("n", "<leader>nw", function() require('neotest').run.run({ jestCommand = 'jest --watch' }) end, { desc = "Jest: modo watch" })
vim.keymap.set("n", "<leader>nx", function() require('neotest').run.stop() end,                    { desc = "Parar testes em execução" })

-- ─────────────────────────────────────────────────────────────────────────────
-- Buffers — barbar
-- ─────────────────────────────────────────────────────────────────────────────
-- Navegação
vim.keymap.set("n", "<leader>bn", "<Cmd>BufferNext<CR>",            { desc = "Próximo buffer" })
vim.keymap.set("n", "<leader>bp", "<Cmd>BufferPrevious<CR>",        { desc = "Buffer anterior" })
vim.keymap.set("n", "<leader>bc", "<Cmd>BufferClose<CR>",           { desc = "Fechar buffer atual" })
vim.keymap.set("n", "<leader>bP", "<Cmd>BufferPin<CR>",             { desc = "Fixar/desafixar buffer" })
vim.keymap.set("n", "<leader>bi", "<Cmd>BufferPick<CR>",            { desc = "Escolher buffer interativamente" })

-- Reordenar buffers
vim.keymap.set("n", "<leader>b<", "<Cmd>BufferMovePrevious<CR>",    { desc = "Mover buffer para esquerda" })
vim.keymap.set("n", "<leader>b>", "<Cmd>BufferMoveNext<CR>",        { desc = "Mover buffer para direita" })

-- Ir direto para buffer por número
vim.keymap.set("n", "<leader>1",  "<Cmd>BufferGoto 1<CR>",          { desc = "Ir para buffer 1" })
vim.keymap.set("n", "<leader>2",  "<Cmd>BufferGoto 2<CR>",          { desc = "Ir para buffer 2" })
vim.keymap.set("n", "<leader>3",  "<Cmd>BufferGoto 3<CR>",          { desc = "Ir para buffer 3" })
vim.keymap.set("n", "<leader>4",  "<Cmd>BufferGoto 4<CR>",          { desc = "Ir para buffer 4" })
vim.keymap.set("n", "<leader>5",  "<Cmd>BufferGoto 5<CR>",          { desc = "Ir para buffer 5" })
vim.keymap.set("n", "<leader>6",  "<Cmd>BufferGoto 6<CR>",          { desc = "Ir para buffer 6" })
vim.keymap.set("n", "<leader>7",  "<Cmd>BufferGoto 7<CR>",          { desc = "Ir para buffer 7" })
vim.keymap.set("n", "<leader>8",  "<Cmd>BufferGoto 8<CR>",          { desc = "Ir para buffer 8" })
vim.keymap.set("n", "<leader>9",  "<Cmd>BufferGoto 9<CR>",          { desc = "Ir para buffer 9" })
vim.keymap.set("n", "<leader>0",  "<Cmd>BufferLast<CR>",            { desc = "Ir para último buffer" })

-- ─────────────────────────────────────────────────────────────────────────────
-- Desabilitar setas (forçar hjkl)
-- ─────────────────────────────────────────────────────────────────────────────
local modes = { "n", "v" }
for _, mode in ipairs(modes) do
  vim.keymap.set(mode, "<Up>",    "<NOP>", { noremap = true, silent = true })
  vim.keymap.set(mode, "<Down>",  "<NOP>", { noremap = true, silent = true })
  vim.keymap.set(mode, "<Left>",  "<NOP>", { noremap = true, silent = true })
  vim.keymap.set(mode, "<Right>", "<NOP>", { noremap = true, silent = true })
end
