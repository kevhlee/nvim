local M = {}

table.insert(M, {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
        require('indent_blankline').setup {
            show_current_context = true,
            show_current_context_start = true,
            char = '▏',
            context_char = '▏',
        }
    end,
})

return M