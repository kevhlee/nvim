return {
    "numToStr/Comment.nvim",
    tag = "v0.8.0",
    pin = true,
    config = function()
        require("Comment").setup({
            padding = true,
            mappings = {
                basic = true,
            },
        })

        require("Comment.ft").set("json", { "//%s", "/*%s*/" })
    end,
}
