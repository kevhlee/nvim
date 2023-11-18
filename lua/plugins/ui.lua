local M = {}

table.insert(M, {
    'utilyre/barbecue.nvim',
    dependencies = {
        'SmiteshP/nvim-navic',
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('barbecue').setup()

        vim.keymap.set('n', '<leader>tw', require('barbecue.ui').toggle)
    end,
})

table.insert(M, {
    'lukas-reineke/indent-blankline.nvim',
    version = '2.20.8',
    config = true,
    opts = {
        show_current_context = true,
        show_current_context_start = true,
        char = '▏',
        context_char = '▏',
    },
})

table.insert(M, {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'arkav/lualine-lsp-progress' },
    config = true,
    opts = {
        options = {
            theme = 'auto',
            globalstatus = true,
            component_separators = '',
            section_separators = '',
            ignore_focus = { 'NvimTree', 'TelescopePrompt' },
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            },
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = {
                { 'filename', path = 1 },
                {
                    'lsp_progress',
                    separators = {
                        component = ' ',
                        progress = ' | ',
                        percentage = { pre = '', post = '%% ' },
                        title = { pre = '', post = ': ' },
                        lsp_client_name = { pre = '[', post = ']' },
                        spinner = { pre = '', post = '' },
                        message = {
                            commenced = 'In Progress',
                            completed = 'Completed',
                        },
                    },
                    display_components = {
                        'lsp_client_name',
                        'spinner',
                        { 'title', 'percentage', 'message' },
                    },
                    spinner_symbols = {
                        '⣾',
                        '⣽',
                        '⣻',
                        '⢿',
                        '⡿',
                        '⣟',
                        '⣯',
                        '⣷',
                    },
                },
            },
            lualine_x = { 'encoding', 'fileformat', 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' },
        },
    },
})

table.insert(M, {
    'echasnovski/mini.hipatterns',
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

return M
