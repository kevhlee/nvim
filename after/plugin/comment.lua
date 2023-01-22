local ok, plugin = pcall(require, 'Comment')
if not ok then
    return
end

plugin.setup {
    padding = true,
    mappings = {
        basic = true,
    },
}

local ft = require 'Comment.ft'

ft.set('json', { '//%s', '/*%s*/' })
