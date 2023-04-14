local ok, metals = pcall(require, 'metals')
if not ok then
    return
end

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('nvim-metals', { clear = true }),
    pattern = { 'java', 'scala', 'sbt' },
    callback = function()
        local config = metals.bare_config()

        config.init_options.statusBarProvider = 'on'
        config.settings = { showImplicitArguments = true }
        config.capabilities = require('cmp_nvim_lsp').default_capabilities()

        config.on_attach = function(client, bufnr)
            metals.setup_dap()
            require('khl.core.lsp').on_attach(client, bufnr)
            require('khl.core.lsp').set_keymap(
                bufnr,
                'n',
                '<leader>ss',
                '<cmd>Telescope metals commands<cr>'
            )
        end

        metals.initialize_or_attach(config)
    end,
})
