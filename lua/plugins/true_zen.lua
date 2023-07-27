local M = {}

table.insert(M, {
    'Pocco81/true-zen.nvim',
    dependencies = { 'folke/twilight.nvim' },
    config = function()
        require('true-zen').setup {
            modes = {
                ataraxis = {
                    shade = 'dark',
                    backdrop = 0,
                    quit_untoggles = true,
                },
            },
            integrations = {
                tmux = true,
                twilight = true,
                lualine = true,
                kitty = {
                    enabled = true,
                    font = '+1',
                },
            },
        }

        vim.keymap.set('n', '<leader>tz', '<cmd>TZAtaraxis<cr>')
    end,
})

return M
