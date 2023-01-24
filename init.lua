-- ####################################################################
-- ## Configuration for Neovim
-- ##
-- ##      ___           ___                       ___
-- ##     /\__\         /\__\          ___        /\__\
-- ##    /::|  |       /:/  /         /\  \      /::|  |
-- ##   /:|:|  |      /:/  /          \:\  \    /:|:|  |
-- ##  /:/|:|  |__   /:/__/  ___      /::\__\  /:/|:|__|__
-- ## /:/ |:| /\__\  |:|  | /\__\  __/:/\/__/ /:/ |::::\__\
-- ## \/__|:|/:/  /  |:|  |/:/  / /\/:/  /    \/__/~~/:/  /
-- ##     |:/:/  /   |:|__/:/  /  \::/__/           /:/  /
-- ##     |::/  /     \::::/__/    \:\__\          /:/  /
-- ##     /:/  /       ~~~~         \/__/         /:/  /
-- ##     \/__/                                   \/__/
-- ##
-- ####################################################################

if not pcall(require, 'impatient') then
    print 'impatient not installed'
end

local ok, config = pcall(require, 'config')
if not ok then
    config = {}
end

require('globals').setup(config)
require('options').setup(config)
require('keymaps').setup(config)
require('colorscheme').setup(config)

require 'plugins'
