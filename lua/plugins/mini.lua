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
}

indentscope.opts = {
    mappings = {
        -- Textobjects
        object_scope = "ii",
        object_scope_with_border = "ai",

        -- Motions
        goto_top = "[i",
        goto_bottom = "]i",
    },
}

return {
    hipatterns,
    indentscope,
}
