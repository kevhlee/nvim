if not pcall(require, 'impatient') then
    print 'impatient not installed'
end

local ok, config = pcall(require, 'khl.config')
if not ok then
    config = {}
end

require('khl.globals').setup(config)
require('khl.options').setup(config)
require('khl.keymaps').setup(config)
require('khl.plugins').setup(config)
require('khl.colorscheme').setup(config)
