local M = {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        -- Utility
        {
            "VonHeikemen/lsp-zero.nvim",
            branch = "v4.x",
            config = false,
        },

        -- Sources
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
    },
}

M.config = function()
    local cmp = require("cmp")
    local cmp_action = require("lsp-zero").cmp_action()

    cmp.setup({
        sources = {
            { name = "nvim_lsp" },
            { name = "buffer" },
        },
        mapping = cmp.mapping.preset.insert({
            ["<cr>"] = cmp.mapping.confirm({ select = false }),
            ["<Tab>"] = cmp_action.tab_complete(),
            ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
        }),
        snippet = {
            expand = function(args)
                vim.snippet.expand(args.body)
            end,
        },
        formatting = require("lsp-zero").cmp_format({ details = true }),
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
    })
end

return M
