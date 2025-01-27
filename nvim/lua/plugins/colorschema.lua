return {
    -- Gruvbox with configuration
    {
        "morhetz/gruvbox",
        config = function()
            vim.g.gruvbox_contrast_dark = "medium"
            vim.cmd("colorscheme gruvbox")
        end,
    },
}

