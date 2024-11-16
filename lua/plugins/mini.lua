--
-- Hipatterns
--

local hipatterns = {
    "echasnovski/mini.hipatterns",
    event = "BufReadPost",
}

hipatterns.opts = function()
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
end

--
-- Indentscope
--

local indentscope = {
    "echasnovski/mini.indentscope",
    event = "BufReadPost",
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
}

--
-- Statusline
--

local statusline = {
    "echasnovski/mini.statusline",
    event = "UIEnter",
}

statusline.opts = function()
    local MiniStatusline = require("mini.statusline")

    return {
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
                    "%=", -- End left alignment
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
    }
end

--
-- Tabline
--

local tabline = {
    "echasnovski/mini.tabline",
    event = "UIEnter",
}

tabline.config = function()
    local MiniTabline = require("mini.tabline")

    MiniTabline.setup({
        format = function(buf_id, label)
            local suffix = vim.bo[buf_id].modified and "+ " or ""
            return MiniTabline.default_format(buf_id, label) .. suffix
        end,
        tabpage_section = "right",
    })

    vim.api.nvim_set_hl(0, "MiniTablineFill", { fg = "None", bg = "None" })
end

return {
    hipatterns,
    indentscope,
    statusline,
    tabline,
}
