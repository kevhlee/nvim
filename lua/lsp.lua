local M = {}
local attach_fn_list = {}

--- @param fn fun(client: vim.lsp.Client, bufnr: integer)
M.add_to_attach = function(fn)
    table.insert(attach_fn_list, fn)
end

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
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

    if client.server_capabilities.documentFormattingProvider then
        vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, opts)
    end
    if client.server_capabilities.documentRangeFormattingProvider then
        vim.keymap.set("v", "<leader>cf", vim.lsp.buf.format, opts)
    end

    for _, attach_fn in ipairs(attach_fn_list) do
        attach_fn(client, bufnr)
    end
end

--- @param client vim.lsp.Client
M.disable_code_formatting = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
end

--- @param client vim.lsp.Client
M.disable_semantic_highlighting = function(client)
    client.server_capabilities.semanticTokensProvider = nil
end

--- @param default_config vim.lsp.ClientConfig
--- @return table<string, vim.lsp.ClientConfig>
M.get_configs = function(default_config)
    local configs = {}
    local ok, override = pcall(require, "custom.lsp")
    if ok and type(override) == "table" then
        for name, get_config in pairs(override) do
            configs[name] = vim.tbl_deep_extend(
                "force",
                default_config,
                get_config({
                    default_on_attach = M.default_on_attach,
                    disable_code_formatting = M.disable_code_formatting,
                    disable_semantic_highlighting = M.disable_semantic_highlighting,
                })
            )
        end
    end
    return configs
end

return M
