local M = {}

table.insert(M, {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'arkav/lualine-lsp-progress',
    },
    config = function()
        require('lualine').setup {
            options = {
                theme = 'auto',
                icons_enabled = true,
                globalstatus = true,
                component_separators = { left = '', right = '' },
                section_separators = {
                    left = '',
                    right = '',
                    -- left = '', right = '',
                    -- left = '', right = '',
                },
                ignore_focus = {
                    'NvimTree',
                },
                disabled_filetypes = {
                    statusline = {
                        'alpha',
                        'packer',
                    },
                    winbar = {
                        'alpha',
                        'packer',
                    },
                },
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
            extensions = {
                'fugitive',
                'nvim-dap-ui',
                'nvim-tree',
            },
        }
    end,
})

return M