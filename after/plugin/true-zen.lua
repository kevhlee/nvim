local ok, plugin = pcall(require, 'true-zen')
if not ok then
    return
end

plugin.setup {
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
