local ok, lsp_zero = pcall(require, 'lsp-zero')
if not ok then
    return
end

lsp_zero.preset 'recommended'

lsp_zero.set_preferences {
    suggest_lsp_servers = false,
    set_lsp_keymaps = false,
    configure_diagnostics = false,
}

lsp_zero.ensure_installed {
    'gopls',
    'lua_ls',
    'ocamllsp',
    'tsserver',
    'vimls',
    'yamlls',
}

lsp_zero.on_attach(require('khl.core.lsp').on_attach)

lsp_zero.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'use', 'vim' },
            },
            workspace = {
                library = {
                    [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                    [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
                },
            },
        },
    },
})

lsp_zero.setup()
