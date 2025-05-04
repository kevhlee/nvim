return {
    -- Diff
    {
        "echasnovski/mini.diff",
        event = "BufReadPre",
        keys = {
            {
                "<Leader>hp",
                "<Cmd>lua MiniDiff.toggle_overlay()<CR>",
                desc = "(MiniDiff) Toggle diff overlay view",
            },
            {
                "<Leader>hq",
                function()
                    vim.fn.setqflist(MiniDiff.export("qf"))
                    vim.cmd("copen")
                end,
                desc = "(MiniDiff) Set quickfix list from all available hunks",
            },
            {
                "<Leader>hl",
                function()
                    vim.fn.setloclist(
                        0,
                        MiniDiff.export("qf", { scope = "current" })
                    )
                    vim.cmd("lopen")
                end,
                desc = "(MiniDiff) Set quickfix list from all available hunks",
            },
            {
                "<Leader>hs",
                function()
                    vim.cmd.normal("gsgh")
                end,
                desc = "(MiniDiff) Stage current hunk",
            },
            {
                "<Leader>hS",
                function()
                    MiniDiff.do_hunks(0, "apply", {
                        line_end = vim.api.nvim_buf_line_count(0),
                        line_start = 1,
                    })
                end,
                desc = "(MiniDiff) Stage current buffer",
            },
            {
                "<Leader>hr",
                function()
                    vim.cmd.normal("gSgh")
                end,
                desc = "(MiniDiff) Reset current hunk",
            },
            {
                "<Leader>hR",
                function()
                    MiniDiff.do_hunks(0, "reset", {
                        line_end = vim.api.nvim_buf_line_count(0),
                        line_start = 1,
                    })
                end,
                desc = "(MiniDiff) Reset current buffer",
            },
        },
        opts = {
            mappings = {
                apply = "gs",
                reset = "gS",
            },
            view = {
                signs = {
                    add = "┆",
                    change = "┆",
                    delete = "_",
                },
                style = "sign",
            },
        },
    },

    -- Git
    {
        "echasnovski/mini-git",
        cmd = "Git",
        event = "BufReadPre",
        keys = {
            {
                "<Leader>hb",
                function()
                    MiniGit.show_at_cursor()
                end,
                desc = "(MiniGit) Show Git related data at cursor depending on context",
                mode = { "n", "x" },
            },
            {
                "<Leader>hB",
                function()
                    MiniGit.show_at_cursor({
                        line_end = vim.api.nvim_buf_line_count(0),
                        line_start = 1,
                    })
                end,
                desc = "(MiniGit) Show Git information for current buffer",
                mode = "n",
            },
        },
        main = "mini.git",
        opts = {},
    },

    -- Icons
    {
        "echasnovski/mini.icons",
        event = "VimEnter",
        opts = {},
    },

    -- Hipatterns
    {
        "echasnovski/mini.hipatterns",
        event = { "BufNewFile", "BufReadPre" },
        opts = function()
            return {
                highlighters = {
                    fixme = {
                        pattern = "%f[%w]()FIXME()%f[%W]",
                        group = "MiniHipatternsFixme",
                    },
                    hack = {
                        pattern = "%f[%w]()HACK()%f[%W]",
                        group = "MiniHipatternsHack",
                    },
                    todo = {
                        pattern = "%f[%w]()TODO()%f[%W]",
                        group = "MiniHipatternsTodo",
                    },
                    note = {
                        pattern = "%f[%w]()NOTE()%f[%W]",
                        group = "MiniHipatternsNote",
                    },
                    hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
                },
            }
        end,
    },

    -- Indentscope
    {
        "echasnovski/mini.indentscope",
        event = { "BufNewFile", "BufReadPre" },
        opts = {
            mappings = {
                -- Textobjects
                object_scope = "ii",
                object_scope_with_border = "ai",

                -- Motions
                goto_top = "[i",
                goto_bottom = "]i",
            },
        },
    },

    -- Surround
    {
        "echasnovski/mini.surround",
        event = { "BufNewFile", "BufReadPre" },
        opts = {},
    },

    -- Statusline
    {
        "echasnovski/mini.statusline",
        event = "VimEnter",
        opts = {
            content = {
                active = function()
                    -- stylua: ignore start
                    local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
                    local git           = MiniStatusline.section_git({ trunc_width = 40 })
                    local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
                    local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
                    local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
                    -- stylua: ignore end

                    return MiniStatusline.combine_groups({
                        {
                            hl = mode_hl,
                            strings = { mode },
                        },
                        {
                            hl = "MiniStatuslineDevinfo",
                            strings = { git, diff },
                        },
                        "%<",
                        {
                            hl = "MiniStatuslineFilename",
                            strings = { filename },
                        },
                        "%=",
                        {
                            hl = "MiniStatuslineFileinfo",
                            strings = { fileinfo },
                        },
                        {
                            hl = mode_hl,
                            strings = { "%l│%2v│%P" },
                        },
                    })
                end,
            },
        },
    },

    -- Tabline
    {
        "echasnovski/mini.tabline",
        config = function(_, opts)
            require("mini.tabline").setup(opts)

            vim.api.nvim_set_hl(0, "TabLineFill", { bg = "None" })
            vim.api.nvim_set_hl(0, "MiniTablineFill", { bg = "None" })
        end,
        event = "VimEnter",
        opts = {
            format = function(buf_id, label)
                if vim.bo[buf_id].modified then
                    label = label .. " +"
                end
                return MiniTabline.default_format(buf_id, label)
            end,
        },
    },
}
