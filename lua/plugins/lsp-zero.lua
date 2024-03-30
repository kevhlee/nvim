local M = {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
        -- LSP Support
        { "neovim/nvim-lspconfig", pin = true },
        { "williamboman/mason.nvim", pin = true },
        { "williamboman/mason-lspconfig.nvim", pin = true },

        -- Autocompletion
        { "hrsh7th/nvim-cmp", pin = true },
        { "hrsh7th/cmp-nvim-lsp", pin = true },
        { "hrsh7th/cmp-nvim-lua", pin = true },
        { "hrsh7th/cmp-buffer", pin = true },
        { "hrsh7th/cmp-path", pin = true },
        { "saadparwaiz1/cmp_luasnip", pin = true },

        -- Snippets
        { "L3MON4D3/LuaSnip", pin = true },
        { "rafamadriz/friendly-snippets", pin = true },
    },
}

M.config = function()
    local lsp_zero = require("lsp-zero")

    lsp_zero.on_attach(require("common").lsp_on_attach)
    lsp_zero.setup_servers({ "clangd", "ocamllsp", "pyright" })

    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
        handlers = {
            lsp_zero.default_setup,
            lua_ls = function()
                require("lspconfig").lua_ls.setup(require("lsp-zero").nvim_lua_ls())
            end,
        },
    })
end

return M
