local M = {}

table.insert(M, {
    "Shatur/neovim-ayu",
    pin = true,
    priority = 1000,
    cond = vim.g.colorscheme == "ayu",
    config = function()
        require("ayu").setup({
            mirage = false,
        })
        vim.cmd("colorscheme ayu")
    end,
})

table.insert(M, {
    "ribru17/bamboo.nvim",
    pin = true,
    priority = 1000,
    cond = vim.g.colorscheme == "bamboo",
    config = function()
        require("bamboo").setup({
            style = "vulgaris", -- 'vulgaris', 'multiplex', 'light'
            transparent = false,
            dim_inactive = false,
            term_colors = true,
            ending_tildes = false,
            code_style = {
                comments = "italic",
            },
        })

        vim.cmd("colorscheme bamboo")
    end,
})

table.insert(M, {
    "ellisonleao/gruvbox.nvim",
    tag = "2.0.0",
    pin = true,
    priority = 1000,
    cond = vim.g.colorscheme == "gruvbox",
    config = function()
        require("gruvbox").setup({
            contrast = "", -- 'hard', 'soft', ''
            terminal_colors = true,
            transparent_mode = true,
            italic = {
                strings = false,
                emphasis = false,
                comments = true,
                folds = false,
            },
        })

        vim.cmd("colorscheme gruvbox")
    end,
})

table.insert(M, {
    "marko-cerovac/material.nvim",
    pin = true,
    priority = 1000,
    cond = vim.g.colorscheme == "material",
    config = function()
        vim.g.material_style = "darker"

        require("material").setup({
            styles = {
                comments = { italic = true },
            },
            plugins = {
                "dap",
                "fidget",
                "flash",
                "gitsigns",
                "harpoon",
                "indent-blankline",
                "mini",
                "nvim-cmp",
                "nvim-navic",
                "nvim-web-devicons",
                "telescope",
            },
            disable = {
                background = false,
                term_colors = false,
                eob_lines = true,
            },
            async_loading = true,
        })

        vim.cmd("colorscheme material")
    end,
})

table.insert(M, {
    "savq/melange-nvim",
    name = "melange.nvim",
    tag = "2023-08-11",
    pin = true,
    priority = 1000,
    cond = vim.g.colorscheme == "melange",
    config = function()
        vim.cmd("colorscheme melange")
    end,
})

table.insert(M, {
    "navarasu/onedark.nvim",
    pin = true,
    priority = 1000,
    cond = vim.g.colorscheme == "onedark",
    config = function()
        require("onedark").setup({
            style = "warmer", -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
            transparent = true,
            term_colors = true,
            ending_tildes = false,
            code_style = {
                comments = "italic",
            },
        })

        vim.cmd("colorscheme onedark")
    end,
})

table.insert(M, {
    "rose-pine/neovim",
    name = "rose-pine.nvim",
    tag = "v1.2.1",
    pin = true,
    priority = 1000,
    cond = vim.g.colorscheme == "rose-pine",
    config = function()
        require("rose-pine").setup({
            variant = "main", -- 'main', 'moon', 'dawn'
            disable_background = true,
            disable_float_background = false,
            disable_italics = true,
        })

        vim.cmd("colorscheme rose-pine")
    end,
})

return M
