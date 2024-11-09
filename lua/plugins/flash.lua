local M = {
    "folke/flash.nvim",
}

M.opts = {
    modes = {
        char = {
            enabled = false,
        },
    },
}

M.keys = {
    {
        "s",
        mode = { "n", "x", "o" },
        function()
            require("flash").jump()
        end,
        desc = "(Flash) Jump to search",
    },
    {
        "S",
        mode = { "n", "x", "o" },
        function()
            require("flash").treesitter()
        end,
        desc = "(Flash) Enables Flash in Treesitter mode",
    },
    {
        "R",
        mode = { "o", "x" },
        function()
            require("flash").treesitter_search()
        end,
        desc = "(Flash) Enables Flash in Treesitter Search mode",
    },
}

return M
