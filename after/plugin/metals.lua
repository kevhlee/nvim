local ok, metals = pcall(require, 'metals')
if not ok then
    return
end

local on_attach = function(_, bufnr)
    -- DAP
    metals.setup_dap()

    -- Key mappings
    local lsp = vim.lsp
    local diagnostic = vim.diagnostic
    local function set_keymap(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, silent = true })
    end

    set_keymap('n', 'K', lsp.buf.hover)
    set_keymap('n', '<C-k>', lsp.buf.signature_help)
    set_keymap('n', '<leader>gD', lsp.buf.declaration)
    set_keymap('n', '<leader>gd', '<cmd>Telescope lsp_definitions<cr>')
    set_keymap('n', '<leader>gi', '<cmd>Telescope lsp_implementations<cr>')
    set_keymap('n', '<leader>gr', '<cmd>Telescope lsp_references<cr>')
    set_keymap('n', '<leader>gt', '<cmd>Telescope lsp_type_definitions<cr>')
    set_keymap('n', '<leader>dl', '<cmd>Telescope diagnostics<cr>')
    set_keymap('n', '<leader>do', diagnostic.open_float)
    set_keymap('n', '<leader>dk', diagnostic.goto_prev)
    set_keymap('n', '<leader>dj', diagnostic.goto_next)
    set_keymap('n', '<leader>ca', lsp.buf.code_action)
    set_keymap('n', '<leader>cr', lsp.buf.rename)
    set_keymap('n', '<leader>cf', lsp.buf.format)

    -- Telescope
    set_keymap('n', '<leader>ss', '<cmd>Telescope metals commands<cr>')
end

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('nvim-metals', { clear = true }),
    pattern = { 'scala', 'sbt' },
    callback = function()
        local config = metals.bare_config()

        config.on_attach = on_attach
        config.init_options.statusBarProvider = 'on'
        config.settings = { showImplicitArguments = true }
        config.capabilities = require('cmp_nvim_lsp').default_capabilities()

        metals.initialize_or_attach(config)
    end,
})
