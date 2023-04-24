local ok, lualine = pcall(require, 'lualine')
if not ok then
    return
end

lualine.setup {
    options = {
        theme = 'auto',
        icons_enabled = true,
        globalstatus = true,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
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
        ...,
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
                    message = { commenced = 'In Progress', completed = 'Completed' },
                },
                display_components = {
                    'lsp_client_name',
                    'spinner',
                    { 'title', 'percentage', 'message' },
                },
            },
        },
    },
    extensions = {
        'fugitive',
        'nvim-dap-ui',
        'nvim-tree',
    },
}
