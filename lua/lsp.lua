local set_keymap = function(bufnr, mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, silent = true })
end

local on_attach = function(client, bufnr)
    local lsp = vim.lsp
    local diagnostic = vim.diagnostic

    set_keymap(bufnr, 'n', 'K', lsp.buf.hover)
    set_keymap(bufnr, 'n', '<C-k>', lsp.buf.signature_help)
    set_keymap(bufnr, 'n', '<leader>gD', lsp.buf.declaration)
    set_keymap(bufnr, 'n', '<leader>gd', '<cmd>Telescope lsp_definitions<cr>')
    set_keymap(bufnr, 'n', '<leader>gi', '<cmd>Telescope lsp_implementations<cr>')
    set_keymap(bufnr, 'n', '<leader>gr', '<cmd>Telescope lsp_references<cr>')
    set_keymap(bufnr, 'n', '<leader>gt', '<cmd>Telescope lsp_type_definitions<cr>')
    set_keymap(bufnr, 'n', '<leader>dl', '<cmd>Telescope diagnostics<cr>')
    set_keymap(bufnr, 'n', '<leader>do', diagnostic.open_float)
    set_keymap(bufnr, 'n', '<leader>dk', diagnostic.goto_prev)
    set_keymap(bufnr, 'n', '<leader>dj', diagnostic.goto_next)
    set_keymap(bufnr, 'n', '<leader>ca', lsp.buf.code_action)
    set_keymap(bufnr, 'n', '<leader>cr', lsp.buf.rename)

    if client.server_capabilities.documentFormattingProvider then
        set_keymap(bufnr, 'n', '<leader>cf', lsp.buf.format)
    end

    if client.server_capabilities.documentRangeFormattingProvider then
        vim.api.nvim_buf_set_option(
            bufnr,
            'formatexpr',
            'v:lua.vim.lsp.formatexpr(#{timeout_ms:250})'
        )

        vim.api.nvim_buf_create_user_command(bufnr, 'LspRangeFormat', function(args)
            vim.lsp.buf.format {
                bufnr = bufnr,
                async = false,
                range = { start = { args.line1, 0 }, ['end'] = { args.line2, 0 } },
            }
        end, { range = true, desc = 'LSP range format' })

        set_keymap(
            bufnr,
            'v',
            '<leader>cf',
            '<cmd>lua vim.lsp.buf.format { bufnr = bufnr, async = false }<cr><esc>'
        )
    end
end

local lsp = require('lsp-zero').preset 'recommended'

lsp.set_preferences {
    suggest_lsp_servers = false,
    set_lsp_keymaps = false,
    configure_diagnostics = false,
}

lsp.on_attach(on_attach)

local configs = {}

configs.lua_ls = {
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
}

local ok, custom = pcall(require, 'custom.lsp')
if ok then
    for server_name, server_configuration in pairs(custom) do
        configs[server_name] = server_configuration
    end
end

local lspconfig = require 'lspconfig'

for server_name, server_configuration in pairs(configs) do
    lspconfig[server_name].setup(server_configuration)
end

lsp.setup()
