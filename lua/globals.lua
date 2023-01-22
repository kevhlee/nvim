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

g['conjure#filetypes'] = {
    'clojure',
    'fennel',
    'lua',
    'lisp',
    'python',
    'rust',
}

g['conjure#mapping#prefix'] = ','
g['conjure#mapping#log_split'] = 'lx'

-- ##
-- ## Colorscheme
-- ##

g.material_style = 'darker'

g.srcery_bold = 1
g.srcery_italic = 1
g.srcery_red = '#EF3F37'
