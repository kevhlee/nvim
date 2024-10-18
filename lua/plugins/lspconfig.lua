local M = {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
    },
}

M.config = function()
    vim.lsp.handlers["textDocument/hover"] =
        vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signature_help"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

    local configs = require("lsp").get_configs()

    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
        handlers = {
            function(name)
                if configs[name] == nil then
                    require("lspconfig")[name].setup(
                        require("lsp").default_config
                    )
                end
            end,
        },
    })

    for name, config in pairs(configs) do
        require("lspconfig")[name].setup(config)
    end
end

return M
