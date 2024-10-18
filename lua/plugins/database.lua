local M = {
    "kndndrj/nvim-dbee",
    cmd = "Dbee",
    dependencies = {
        { "MunifTanjim/nui.nvim" },
    },
}

M.build = function()
    require("dbee").install()
end

M.opts = function()
    return {
        -- See https://github.com/kndndrj/nvim-dbee?tab=readme-ov-file#specifying-connections to learn
        -- how to set up connections through the environment.
        sources = {
            require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
            require("dbee.sources").FileSource:new(
                vim.fn.stdpath("cache") .. "/dbee/persistence.json"
            ),
        },
    }
end

return M
