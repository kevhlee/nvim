local ok, comment = pcall(require, 'Comment')
if not ok then
  return
end

comment.setup {
  padding = true,
  mappings = {
    basic = true,
  },
}

local ft = require 'Comment.ft'

ft.set('json', { '//%s', '/*%s*/' })
