if not pcall(require, 'true-zen') then
    return
end

require('true-zen').setup {
    modes = {
        ataraxis = {
            shade = 'dark',
            backdrop = 0,
            quit_untoggles = true,
        },
    },
    integrations = {
        tmux = true,
        twilight = true,
        lualine = true,
        kitty = {
            enabled = true,
            font = '+0',
        },
    },
}

vim.keymap.set('n', '<leader>tz', '<cmd>TZAtaraxis<cr>')
