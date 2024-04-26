return {
    "nvim-treesitter/nvim-treesitter",
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
