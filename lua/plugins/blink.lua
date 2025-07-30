return {
    "saghen/blink.cmp",
    dependencies = {
        { "rafamadriz/friendly-snippets" },
    },
    event = "InsertEnter",
    opts = {
        cmdline = { enabled = false },
        -- https://cmp.saghen.dev/configuration/completion.html
        completion = {
            documentation = {
                auto_show = true,
            },
            list = {
                selection = {
                    auto_insert = false,
                    preselect = true,
                },
            },
            menu = {
                draw = {
                    columns = {
                        { "label", "label_description", gap = 1 },
                        { "kind_icon", "kind" },
                    },
                },
            },
        },
        enabled = function()
            return not vim.tbl_contains({ "bigfile", "dap-repl" }, vim.bo.filetype)
        end,
        -- https://cmp.saghen.dev/configuration/fuzzy.html
        fuzzy = {
            implementation = "prefer_rust",
            sorts = { "exact", "score", "sort_text" },
        },
        -- https://cmp.saghen.dev/configuration/keymap.html
        keymap = {
            preset = "super-tab",
        },
        -- https://cmp.saghen.dev/configuration/signature.html
        signature = {
            enabled = true,
            window = {
                show_documentation = false,
            },
        },
        -- https://cmp.saghen.dev/configuration/snippets.html
        snippets = {
            preset = "default",
        },
        -- https://cmp.saghen.dev/configuration/sources.html
        sources = {
            per_filetype = {
                markdown = { "buffer", "path" },
            },
        },
    },
    version = "1.*",
}
