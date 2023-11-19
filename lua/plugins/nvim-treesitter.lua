return {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.1",
    pin = true,
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "lua", "markdown", "vim", "vimdoc" },
            auto_install = false,
            highlight = {
                enable = true,
                disable = {},
            },
        })
    end,
}
