if not pcall(require, 'nvim-treesitter') then
    return
end

require('nvim-treesitter.configs').setup {
    auto_install = true,
    ensure_installed = {
        'c',
        'lua',
        'markdown',
        'rust',
        'vim',
    },
    highlight = {
        enable = true,
    },
}
