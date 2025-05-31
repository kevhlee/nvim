return {
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

    -- Icons
    {
        "echasnovski/mini.icons",
        event = "VimEnter",
        opts = {},
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
                if vim.fn.bufwinid(buf_id) == -1 then
                    return ""
                end

                if vim.bo[buf_id].modified then
                    label = label .. " +"
                end
                return MiniTabline.default_format(buf_id, label)
            end,
        },
    },
}
