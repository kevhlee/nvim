local M = {
    "hrsh7th/nvim-cmp",
    dependencies = {
        -- Sources
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lsp-signature-help" },
        { "hrsh7th/cmp-buffer" },
        { "saadparwaiz1/cmp_luasnip" },

        -- Snippets
        { "L3MON4D3/LuaSnip" },
        { "rafamadriz/friendly-snippets" },
    },
    event = "InsertEnter",
}

M.config = function()
    local cmp = require("cmp")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
        sources = {
            { name = "nvim_lsp" },
            { name = "nvim_lsp_signature_help" },
            { name = "luasnip" },
            { name = "buffer" },
        },
        preselect = "item",
        completion = {
            completeopt = "menu,menuone,noinsert",
        },
        mapping = cmp.mapping.preset.insert({
            ["<Tab>"] = cmp.mapping.confirm({ select = false }),
            ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            ["<C-d>"] = cmp.mapping.scroll_docs(4),
        }),
        snippet = {
            expand = function(args)
                vim.snippet.expand(args.body)
            end,
        },
        formatting = {
            fields = { "abbr", "kind", "menu" },
            format = function(entry, item)
                local name = entry.source.name
                local label = ""

                if name == "nvim_lsp" then
                    label = "[lsp]"
                elseif name == "nvim_lua" then
                    label = "[nvim]"
                else
                    label = string.format("[%s]", name)
                end

                if item.menu == nil then
                    item.menu = label
                else
                    item.menu = string.format("%s %s", label, item.menu)
                end

                return item
            end,
        },
    })
end

return M