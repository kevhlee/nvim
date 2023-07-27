local M = {}

table.insert(M, {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require('nvim-treesitter.configs').setup {
            auto_install = true,
            ensure_installed = {
                'lua',
                'markdown',
                'vim',
            },
            highlight = {
                enable = true,
            },
        }
    end,
})

return M
