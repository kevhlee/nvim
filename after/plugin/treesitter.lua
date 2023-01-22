if not pcall(require, 'nvim-treesitter') then
    return
end

require('nvim-treesitter.configs').setup {
    auto_install = true,
    ensure_installed = {
        'c',
        'help',
        'lua',
        'markdown',
        'vim',
    },
    highlight = {
        enable = true,
    },
}
