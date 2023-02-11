local M = {}

M.set_keymap = function(bufnr, mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, silent = true })
end

M.on_attach = function(client, bufnr)
    local lsp = vim.lsp
    local diagnostic = vim.diagnostic

    M.set_keymap(bufnr, 'n', 'K', lsp.buf.hover)
    M.set_keymap(bufnr, 'n', '<C-k>', lsp.buf.signature_help)
    M.set_keymap(bufnr, 'n', '<leader>gD', lsp.buf.declaration)
    M.set_keymap(bufnr, 'n', '<leader>gd', '<cmd>Telescope lsp_definitions<cr>')
    M.set_keymap(bufnr, 'n', '<leader>gi', '<cmd>Telescope lsp_implementations<cr>')
    M.set_keymap(bufnr, 'n', '<leader>gr', '<cmd>Telescope lsp_references<cr>')
    M.set_keymap(bufnr, 'n', '<leader>gt', '<cmd>Telescope lsp_type_definitions<cr>')
    M.set_keymap(bufnr, 'n', '<leader>dl', '<cmd>Telescope diagnostics<cr>')
    M.set_keymap(bufnr, 'n', '<leader>do', diagnostic.open_float)
    M.set_keymap(bufnr, 'n', '<leader>dk', diagnostic.goto_prev)
    M.set_keymap(bufnr, 'n', '<leader>dj', diagnostic.goto_next)
    M.set_keymap(bufnr, 'n', '<leader>ca', lsp.buf.code_action)
    M.set_keymap(bufnr, 'n', '<leader>cr', lsp.buf.rename)

    if client.server_capabilities.documentFormattingProvider then
        M.set_keymap(bufnr, 'n', '<leader>cf', lsp.buf.format)
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

        M.set_keymap(
            bufnr,
            'v',
            '<leader>cf',
            '<cmd>lua vim.lsp.buf.format { bufnr = bufnr, async = false }<cr><esc>'
        )
    end
end

return M
