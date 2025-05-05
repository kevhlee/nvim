return {
    "folke/snacks.nvim",
    keys = {
        -- Bufdelete
        {
            "<C-b>d",
            "<Cmd>lua Snacks.bufdelete.delete()<CR>",
            desc = "(Snacks) Delete current buffer",
        },

        -- Picker
        {
            "<Leader>fr",
            "<Cmd>lua Snacks.picker.resume()<CR>",
            desc = "(Snacks) Resume previous search",
        },
        {
            "<Leader>ff",
            function()
                Snacks.picker.files({
                    hidden = true,
                    layout = {
                        preview = false,
                    },
                })
            end,
            desc = "(Snacks) Search for files",
        },
        {
            "<Leader>fg",
            function()
                Snacks.picker.grep({
                    layout = {
                        layout = {
                            width = 0.5,
                        },
                        preset = "vscode",
                    },
                })
            end,
            desc = "(Snacks) Search for a pattern",
        },
        {
            "<Leader>fG",
            function()
                Snacks.picker.grep_buffers({
                    layout = {
                        layout = {
                            width = 0.5,
                        },
                        preset = "vscode",
                    },
                })
            end,
            desc = "(Snacks) Search for a pattern in currently open buffers",
        },
        {
            "<Leader>fs",
            function()
                Snacks.picker.grep_word({
                    layout = {
                        layout = {
                            width = 0.5,
                        },
                        preset = "vscode",
                    },
                })
            end,
            desc = "(Snacks) Search for a word",
            mode = { "n", "x" },
        },
        {
            "<Leader>fd",
            function()
                Snacks.picker.diagnostics({
                    layout = {
                        layout = {
                            width = 0.5,
                        },
                        preset = "vscode",
                    },
                })
            end,
            desc = "(Snacks) List diagnostic messages",
        },
        {
            "<Leader>fb",
            function()
                Snacks.picker.buffers({
                    layout = {
                        preview = false,
                    },
                    win = {
                        input = {
                            keys = {
                                ["dd"] = {
                                    "bufdelete",
                                    mode = { "n" },
                                },
                                ["<C-d>"] = {
                                    "bufdelete",
                                    mode = { "i" },
                                },
                            },
                        },
                    },
                })
            end,
            desc = "(Snacks) List open buffers",
        },
        {
            "<Leader>fk",
            function()
                Snacks.picker.keymaps({
                    layout = {
                        preview = false,
                    },
                })
            end,
            desc = "(Snacks) List registered key mappings",
        },
        {
            "<Leader>fm",
            function()
                Snacks.picker.marks({
                    layout = {
                        layout = {
                            width = 0.5,
                        },
                        preset = "vscode",
                    },
                })
            end,
        },
        {
            "<Leader>f'",
            "<Cmd>lua Snacks.picker.git_status()<CR>",
            desc = "(Snacks) List contents of Git working tree",
        },
        {
            "<Leader>f/",
            "<Cmd>lua Snacks.picker.git_branches()<CR>",
            desc = "(Snacks) List Git branches",
        },
        {
            "<Leader>ft",
            function()
                Snacks.picker.treesitter({
                    filter = {
                        default = {
                            "Class",
                            "Enum",
                            "Field",
                            "Function",
                            "Method",
                            "Module",
                            "Namespace",
                            "Struct",
                            "Trait",
                            "Variable",
                        },
                    },
                })
            end,
            desc = "(Snacks) List Treesitter symbols",
        },
        {
            "<Leader>fn",
            "<Cmd>lua Snacks.picker.notifications()<CR>",
            desc = "(Snacks) List notifications",
        },

        -- Scratch
        {
            "<Leader>.",
            "<Cmd>lua Snacks.scratch()<CR>",
            desc = "(Snacks) Toggle scratch buffer",
        },
        {
            "<Leader>S",
            "<Cmd>lua Snacks.scratch.select()<CR>",
            desc = "(Snacks) Select scratch buffer",
        },

        -- Zen
        {
            "<Leader>tz",
            "<Cmd>lua Snacks.zen()<CR>",
            desc = "(Snacks) Toggle zen mode",
        },
    },
    lazy = false,
    priority = 1000,
    opts = {
        bigfile = {
            size = 1.5 * 1024 * 1024, -- 1.5 MB
        },
        input = {},
        notifier = {
            date_format = "%H:%M:%S",
            style = "fancy",
        },
        styles = {
            zen = {
                width = 0.8,
                height = 0.9,
            },
        },
        picker = {
            ui_select = true,
            win = {
                input = {
                    keys = {
                        ["<C-l>"] = {
                            "loclist",
                            mode = { "i", "n" },
                        },
                    },
                },
            },
        },
        scratch = {
            win_by_ft = {},
        },
        statuscolumn = {
            folds = {
                git_hl = true,
                open = true,
            },
            left = { "git", "mark" },
            right = { "sign", "fold" },
        },
        zen = {},
    },
}
