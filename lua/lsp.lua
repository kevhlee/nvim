-- Set up diagnostics

vim.diagnostic.config({
    virtual_text = {
        current_line = true,
    },
})

-- Set up LSP progress notifications

local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }

vim.api.nvim_create_autocmd("LspProgress", {
    ---@param args {data: {client_id: integer, params: lsp.ProgressParams}}
    callback = function(args)
        vim.notify(vim.lsp.status(), vim.log.levels.INFO, {
            id = "lsp_progress",
            opts = function(notif)
                notif.icon = args.data.params.value.kind == "end" and " "
                    or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
            end,
            title = "LSP Progress",
        })
    end,
})

-- Set up LSP attach

local trigger_chars = {}
for i = 32, 126 do
    table.insert(trigger_chars, string.char(i))
end

vim.api.nvim_create_autocmd("LspAttach", {
    ---@param args {buf: integer, data: {client_id: integer}}
    callback = function(args)
        local opts = { buffer = args.buf }

        vim.keymap.set("n", "grd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "grt", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", opts)

        vim.keymap.set("i", "<CR>", function()
            return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
        end, { expr = true })

        vim.keymap.set("i", "<Tab>", function()
            return vim.fn.pumvisible() == 1 and "<C-y>" or "<Tab>"
        end, { expr = true })

        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        if client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
            client.server_capabilities.completionProvider.triggerCharacters =
                trigger_chars

            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end
    end,
})

-- Set up LSP servers

vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPre" }, {
    callback = function()
        local lsp_names = vim.iter(vim.api.nvim_get_runtime_file("lsp/*.lua", true))
            :map(function(file)
                return vim.fn.fnamemodify(file, ":t:r")
            end)
            :totable()

        vim.lsp.enable(lsp_names)
    end,
    once = true,
})
