return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- Para ícones
        config = function()
            require("lualine").setup({
                options = {
                    theme = "gruvbox", -- Tema principal
                    icons_enabled = true,
                    component_separators = { left = "⮞", right = "⮜" }, -- Setas transparentes
                    section_separators = { left = "⮞", right = "⮜" }, -- Setas entre seções
                    globalstatus = true, -- Statusline única
                },
                sections = {
                    -- Seção da esquerda
                    lualine_a = {
                        { 
                            "mode", 
                            fmt = function(str) return str:upper() end, -- Exibe o modo completo em maiúsculas
                            color = { fg = "#282828", bg = "#fabd2f", gui = "bold" }, 
                        },
                    },
                    lualine_b = {
                        { 
                            "branch", 
                            icon = "", 
                            color = { fg = "#ebdbb2", bg = "#458588" } 
                        },
                        { 
                            "diff", 
                            symbols = { added = " ", modified = "柳", removed = " " }, -- Ícones para diff
                            color = { bg = "#458588" } 
                        },
                    },
                    -- Seção central
                    lualine_c = {
                        { 
                            "filename", 
                            path = 1, -- Caminho relativo
                            color = { fg = "#ebdbb2", bg = "#282828" },
                        },
                    },
                    -- Seção da direita
                    lualine_x = {
                        {
                            function()
                                return os.date("%d/%m/%Y %H:%M") -- Data e hora
                            end,
                            color = { fg = "#ebdbb2", bg = "#504945" },
                        },
                        { 
                            "filetype", 
                            icon_only = true, 
                            color = { fg = "#ebdbb2", bg = "#504945" } 
                        },
                        { 
                            "filetype", 
                            color = { fg = "#ebdbb2", bg = "#504945" } 
                        },
                    },
                    lualine_y = {},
                    lualine_z = {
                        { 
                            "location", 
                            color = { fg = "#282828", bg = "#d3869b" }, -- Linha e coluna
                        },
                    },
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

