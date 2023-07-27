local M = {}

table.insert(M, {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup {
            padding = true,
            mappings = {
                basic = true,
            },
        }

        local ft = require 'Comment.ft'

        ft.set('json', { '//%s', '/*%s*/' })
    end,
})

return M
