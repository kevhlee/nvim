if not pcall(require, 'nvim-tree') then
    return
end

require('nvim-tree').setup {
    view = {
        side = 'left',
        adaptive_size = true,
    },
    filters = {
        custom = {
            '\\.DS_Store',
            '\\.git/',
            'node_modules/*',
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = false,
    },
    git = {
        enable = true,
        ignore = false,
    },
    filesystem_watchers = { enable = true },
    renderer = {
        indent_markers = { enable = true },
        highlight_git = true,
    },
}

vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<cr>')
vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeFocus<cr>')
