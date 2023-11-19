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

    lsp_zero.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }

        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)

        if pcall(require, "telescope") then
            vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
            vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
            vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)
            vim.keymap.set("n", "go", "<cmd>Telescope lsp_type_definitions<cr>", opts)
            vim.keymap.set("n", ".d", "<cmd>Telescope diagnostics<cr>", opts)
        else
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
            vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
        end

        if client.server_capabilities.documentFormattingProvider then
            vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, opts)
        end

        -- For disabling syntax highlighting from LSP
        client.server_capabilities.semanticTokensProvider = nil
    end)

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
