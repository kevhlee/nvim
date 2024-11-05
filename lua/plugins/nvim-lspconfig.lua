local M = {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
    },
    cmd = {
        "LspInfo",
        "LspInstall",
        "LspStart",
        "LspUninstall",
        "Mason",
        "MasonInstall",
        "MasonUninstall",
        "MasonUninstallAll",
        "MasonUpdate",
    },
    event = "BufReadPost",
}

M.config = function()
    local defaults =
        vim.tbl_deep_extend("force", require("lspconfig").util.default_config, {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            on_attach = require("lsp").default_on_attach,
        })

    local specs = require("lsp").get_config_specs(defaults)

    require("mason").setup()

    require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
        handlers = {
            function(server_name)
                local spec = specs[server_name]
                if not spec or not spec.skip then
                    require("lspconfig")[server_name].setup(defaults)
                end
            end,
        },
    })

    for name, spec in pairs(specs) do
        if not spec.skip then
            require("lspconfig")[name].setup(spec.config or defaults)
        end
    end
end

return M
