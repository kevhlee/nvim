local M = {}

table.insert(M, {
    'echasnovski/mini.hipatterns',
    version = '*',
    config = function()
        local hipatterns = require 'mini.hipatterns'

        hipatterns.setup {
            highlighters = {
                -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                fixme = {
                    pattern = '%f[%w]()FIXME()%f[%W]',
                    group = 'MiniHipatternsFixme',
                },
                hack = {
                    pattern = '%f[%w]()HACK()%f[%W]',
                    group = 'MiniHipatternsHack',
                },
                todo = {
                    pattern = '%f[%w]()TODO()%f[%W]',
                    group = 'MiniHipatternsTodo',
                },
                note = {
                    pattern = '%f[%w]()NOTE()%f[%W]',
                    group = 'MiniHipatternsNote',
                },

                -- Highlight hex color strings (`#rrggbb`) using that color
                hex_color = hipatterns.gen_highlighter.hex_color(),
            },
        }
    end,
})

table.insert(M, {
    'echasnovski/mini.map',
    version = '*',
    config = function()
        local minimap = require 'mini.map'

        minimap.setup {
            symbols = {
                encode = minimap.gen_encode_symbols.dot '3x2',
                scroll_line = '▶',
                scroll_view = '┋',
            },
            window = {
                focusable = false,
                side = 'right',
                width = 15,
                winblend = 25,
            },
        }

        vim.keymap.set('n', '<leader>tm', minimap.toggle)
        vim.keymap.set('n', '<leader>tf', minimap.toggle_focus)

        minimap.open()
    end,
})

table.insert(M, {
    'echasnovski/mini.move',
    version = '*',
    opts = {
        -- Move selection in Visual mode
        mappings = {
            left = '',
            right = '',
            down = '<C-j>',
            up = '<C-k>',

            -- Move current line in Normal mode
            line_left = '',
            line_right = '',
            line_down = '',
            line_up = '',
        },
        options = {
            reindent_linewise = false,
        },
    },
})

return M
