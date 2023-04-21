local ok, lsp_zero = pcall(require, 'lsp-zero')
if not ok then
    return
end

local lsp = lsp_zero.preset 'recommended'

lsp.set_preferences {
    suggest_lsp_servers = false,
    set_lsp_keymaps = false,
    configure_diagnostics = false,
}

lsp.ensure_installed {
    'gopls',
    'lua_ls',
    'tsserver',
    'vimls',
    'yamlls',
}

lsp.on_attach(require('khl.core.lsp').on_attach)

lsp.configure('lua_ls', {
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

local lspconfig = require 'lspconfig'
local server_names = { 'ocamllsp' }

for _, server_name in ipairs(server_names) do
    lspconfig[server_name].setup {}
end

lsp.setup()
