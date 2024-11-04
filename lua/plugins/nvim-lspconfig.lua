local M = {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
    },
    cmd = { "LspInfo", "LspInstall", "LspStart", "LspUninstall" },
    event = "BufReadPost",
}

local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr }

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    if client.server_capabilities.documentFormattingProvider then
        vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, opts)
    end
    if client.server_capabilities.documentRangeFormattingProvider then
        vim.keymap.set("v", "<leader>cf", vim.lsp.buf.format, opts)
    end
end

M.config = function()
    local config =
        vim.tbl_deep_extend("force", require("lspconfig").util.default_config, {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            on_attach = on_attach,
        })

    require("mason").setup()

    require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
        handlers = {
            function(server_name)
                require("lspconfig")[server_name].setup(config)
            end,
        },
    })
end

return M
