return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'arkav/lualine-lsp-progress' },
    opts = {
        options = {
            theme = 'auto',
            globalstatus = true,
            component_separators = '',
            section_separators = '',
            ignore_focus = { 'NvimTree' },
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
    config = true,
}
