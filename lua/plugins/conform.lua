local M = {
    "stevearc/conform.nvim",
    cmd = "ConformInfo",
}

M.config = function()
    local formatters = {}
    local formatters_by_ft = {}

    local ok, override = pcall(require, "override.formatter")
    if ok and type(override) == "table" then
        formatters = override.formatters or formatters
        formatters_by_ft = override.formatters_by_ft or formatters
    end

    require("conform").setup({
        formatters = formatters,
        formatters_by_ft = formatters_by_ft,
    })
end

M.keys = {
    {
        "<leader>cf",
        function()
            require("conform").format({ async = true })
        end,
        mode = "",
        desc = "(Conform) Format buffer",
    },
}

return M
