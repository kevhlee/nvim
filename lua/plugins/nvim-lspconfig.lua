--- @class LspConfigSpec
--- @field config? vim.lsp.ClientConfig
--- @field skip boolean

--- @param defaults vim.lsp.ClientConfig
--- @return table<string, LspConfigSpec>
local function get_config_specs(defaults)
    local specs = {}
    local ok, override = pcall(require, "override.lsp")
    if ok and type(override) == "table" then
        for name, get_spec in pairs(override) do
            specs[name] = get_spec(defaults)
        end
    end
    return specs
end

--- @param client vim.lsp.Client
--- @param bufnr integer
local function default_on_attach(client, bufnr)
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
end

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
            on_attach = default_on_attach,
        })

    local specs = get_config_specs(defaults)

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
