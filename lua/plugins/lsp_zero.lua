return {
    'VonHeikemen/lsp-zero.nvim',
    version = 'v2.x',
    dependencies = {
        -- LSP Support
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- Autocompletion
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',

        -- Snippets
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',
    },
    config = function()
        local lsp = require('lsp-zero').preset 'recommended'

        lsp.set_preferences {
            suggest_lsp_servers = false,
            set_lsp_keymaps = false,
            configure_diagnostics = false,
        }

        lsp.on_attach(require('lsp').on_attach)

        local configs = {
            lua_ls = {
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
    end,
}
