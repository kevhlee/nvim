local M = {}
local g = vim.g

-- ##
-- ## General
-- ##

g.mapleader = ' '
g.maplocalleader = ' '

-- ##
-- ## Plugin
-- ##

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- ##
-- ## Colorscheme
-- ##

g.adwaita_darker = false
g.adwaita_transparent = true

g.material_style = 'darker'

g.srcery_bold = 1
g.srcery_italic = 1
g.srcery_red = '#EF3F37'

-- ##
-- ## Custom
-- ##

M.setup = function(config)
    if config.globals == nil then
        return
    end

    for key, value in pairs(config.globals) do
        g[key] = value
    end
end

return M
