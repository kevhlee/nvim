return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    lazy = true,
    event = "VeryLazy",
    config = function()
        require("ibl").setup({
            scope = {
                enabled = true,
                include = {
                    node_type = {
                        ["*"] = { "*" },
                    },
                },
            },
        })
    end,
}
