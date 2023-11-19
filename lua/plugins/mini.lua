return {
    "echasnovski/mini.hipatterns",
    tag = "v0.11.0",
    pin = true,
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
}
