if not pcall(require, 'Comment') then
    return
end

require('Comment').setup {
    padding = true,
    mappings = {
        basic = true,
    },
}

local ft = require 'Comment.ft'

ft.set('json', { '//%s', '/*%s*/' })
