# Dotfiles

Personal configuration files, currently focused on Neovim.

## Requirements

- Neovim >= 0.11
- Git
- [ripgrep](https://github.com/BurntSushi/ripgrep) — required for Telescope live grep
- A [Nerd Font](https://www.nerdfonts.com/) — required for icons

## Installation

Clone the repository:

```sh
git clone git@github.com:pvfm/configs.git
```

Copy the Neovim config to `~/.config/nvim`:

```sh
cp -r configs/nvim ~/.config/nvim
```

## Updating

To sync local Neovim config back into the repository:

```sh
sh update_script.sh
```

## Structure

```
configs/
├── nvim/
│   ├── init.lua
│   └── lua/
│       ├── core/
│       │   ├── keymaps.lua   # All key bindings
│       │   ├── settings.lua  # Editor options
│       │   └── lazy.lua      # Plugin manager bootstrap
│       └── plugins/          # One file per plugin
├── shortcuts.sh              # Shell aliases
└── update_script.sh          # Syncs nvim config to repo
```

## Plugins

| Plugin | Purpose |
|---|---|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) | Color scheme (soft contrast) |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | File explorer |
| [mason.nvim](https://github.com/mason-org/mason.nvim) | LSP/linter/formatter installer |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP client configuration |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Code formatting |
| [neogit](https://github.com/NeogitOrg/neogit) | Git UI |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git hunk actions and blame |
| [blame.nvim](https://github.com/FabijanZulj/blame.nvim) | Full-file git blame panel |
| [neotest](https://github.com/nvim-neotest/neotest) | Test runner |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Integrated terminal |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line |
| [barbar.nvim](https://github.com/romgrk/barbar.nvim) | Buffer tabs |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keymap hints |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets/quotes |

## LSP Servers

Managed via Mason and auto-installed:

- `ruby_lsp` — Ruby / Rails (uses asdf shim)
- `ts_ls` — TypeScript / JavaScript
- `vue_ls` — Vue (Volar v2, hybrid mode with ts_ls)
- `gopls` — Go
- `lua_ls` — Lua
- `html`, `cssls`, `jsonls`, `yamlls`

## Keymaps

`<leader>` is set to `<Space>`.

### Navigation

| Key | Action |
|---|---|
| `<C-h/j/k/l>` | Move between splits |
| `<C-↑/↓/←/→>` | Resize splits |
| `<C-=>` | Equalize split sizes |

### Files & Search (`<leader>f`)

| Key | Action |
|---|---|
| `<leader>ff` | Find file by name |
| `<leader>fg` | Live grep across files |
| `<leader>fb` | List open buffers |
| `<leader>fr` | Recent files |
| `<leader>fh` | Search Neovim help |
| `<leader>fk` | List all keymaps |

### Git (`<leader>g`)

| Key | Action |
|---|---|
| `<leader>go` | Open Neogit panel |
| `<leader>gc` | Browse commit history |
| `<leader>gs` | View modified files |
| `<leader>gB` | List branches |
| `<leader>gb` | Toggle full-file blame panel |
| `<leader>gi` | Toggle inline blame on current line |
| `<leader>gp` | Preview current hunk |
| `<leader>ga` | Stage current hunk |
| `<leader>gu` | Undo stage current hunk |
| `<leader>gr` | Reset current hunk |
| `]h` / `[h` | Next / previous hunk |

### LSP (`<leader>l`)

| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | List references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<leader>lf` | Format current file |
| `<leader>lr` | Rename symbol |
| `<leader>ld` | Show diagnostic detail |
| `<leader>la` | Code actions |
| `]d` / `[d` | Next / previous diagnostic |

### Tests (`<leader>n`)

| Key | Action |
|---|---|
| `<leader>nr` | Run tests in current file |
| `<leader>nl` | Re-run last test |
| `<leader>ns` | Toggle test summary panel |
| `<leader>no` | Open test output |
| `<leader>nw` | Jest watch mode |
| `<leader>nx` | Stop running tests |

### Buffers (`<leader>b`)

| Key | Action |
|---|---|
| `<leader>bn` | Next buffer |
| `<leader>bp` | Previous buffer |
| `<leader>bc` | Close current buffer |
| `<leader>bP` | Pin/unpin buffer |
| `<leader>bi` | Pick buffer interactively |
| `<leader>b<` / `<leader>b>` | Move buffer left / right |
| `<leader>1-9` | Jump to buffer by number |
| `<leader>0` | Jump to last buffer |

### Other

| Key | Action |
|---|---|
| `<leader>e` | Toggle file explorer (Neo-tree) |
| `<leader>tt` | Toggle terminal |
| `<leader>sv` | Vertical split |
| `<leader>sh` | Horizontal split |
| `<leader>tn` | New tab |
| `<leader>w` | Save file |
| `<leader>W` | Save all files |
| `<leader>q` | Close buffer |
| `<leader>Q` | Close all |

## Troubleshooting

### Error: BufReadPost Autocommands

Run `:TSUpdate <language>` to install the missing Treesitter parser for the affected language.
