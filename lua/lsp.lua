--- @class LspConfigSpec
--- @field config? vim.lsp.ClientConfig
--- @field skip boolean

local M = {}

--- @param client vim.lsp.Client
--- @param bufnr integer
M.default_on_attach = function(client, bufnr)
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

--- @param defaults vim.lsp.ClientConfig
--- @return table<string, LspConfigSpec>
M.get_config_specs = function(defaults)
    local specs = {}
    local ok, override = pcall(require, "override.lsp")
    if ok and type(override) == "table" then
        for name, get_spec in pairs(override) do
            specs[name] = get_spec(defaults)
        end
    end
    return specs
end

return M
