local M = {
    "folke/flash.nvim",
    tag = "v1.18.2",
    pin = true,
    lazy = true,
    event = "VeryLazy",
    opts = {
        prompt = {
            enabled = true,
            prefix = {
                { "⚡", "FlashPromptIcon" },
            },
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
        desc = "Flash",
    },
    {
        "S",
        mode = { "n", "x", "o" },
        function()
            require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
    },
}

return M
