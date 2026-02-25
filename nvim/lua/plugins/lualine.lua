return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- Caracteres powerline via bytes UTF-8 explícitos (U+E0B0 a U+E0B3)
            -- Evita corrupção por copy-paste de glyphs do Private Use Area
            local arrow = {
                right_fill  = string.char(238, 130, 176), -- U+E0B0 ▶ seta sólida →
                right_thin  = string.char(238, 130, 177), -- U+E0B1   seta fina →
                left_fill   = string.char(238, 130, 178), -- U+E0B2 ◀ seta sólida ←
                left_thin   = string.char(238, 130, 179), -- U+E0B3   seta fina ←
            }

            require("lualine").setup({
                options = {
                    theme = "gruvbox",
                    icons_enabled = true,
                    -- Setas grandes entre seções (estilo agnoster)
                    section_separators   = { left = arrow.right_fill, right = arrow.left_fill },
                    -- Setas finas entre componentes dentro de uma seção
                    component_separators = { left = arrow.right_thin, right = arrow.left_thin },
                    globalstatus = true,
                },
                sections = {
                    -- [MODO] bloco amarelo à esquerda
                    lualine_a = {
                        {
                            "mode",
                            fmt = function(str) return str:upper() end,
                        },
                    },

                    -- [BRANCH + DIFF] bloco azul
                    lualine_b = {
                        { "branch" },
                        {
                            "diff",
                            symbols = { added = "+", modified = "~", removed = "-" },
                        },
                    },

                    -- [ARQUIVO] centro
                    lualine_c = {
                        {
                            "filename",
                            path = 1, -- caminho relativo
                            symbols = {
                                modified = " ●",
                                readonly = " [RO]",
                                unnamed  = "[sem nome]",
                            },
                        },
                    },

                    -- [DIAGNÓSTICOS + FILETYPE + ENCODING] lado direito
                    lualine_x = {
                        {
                            "diagnostics",
                            symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" },
                        },
                        {
                            function()
                                return (vim.bo.expandtab and "spaces" or "tabs") .. ":" .. vim.bo.shiftwidth
                            end,
                        },
                        { "encoding" },
                        {
                            function()
                                return vim.bo.fileformat == "unix" and "LF" or "CRLF"
                            end,
                        },
                        { "filetype" },
                    },

                    -- [PROGRESSO] bloco verde
                    lualine_y = { "progress" },

                    -- [LINHA:COLUNA] bloco roxo à direita
                    lualine_z = { "location" },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
            })
        end,
    },
}
