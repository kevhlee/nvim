return {
    'nvim-treesitter/nvim-treesitter',
    tag = 'v0.9.0',
    config = function()
        require('nvim-treesitter.configs').setup {
            auto_install = true,
            ensure_installed = { 'lua', 'vim' },
            highlight = {
                enable = true,
            },
        }
    end,
}
