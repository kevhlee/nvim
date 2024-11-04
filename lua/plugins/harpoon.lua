local M = {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
    },
}

M.config = function()
    local harpoon = require("harpoon")

    harpoon.setup()

    harpoon:extend({
        UI_CREATE = function(ctx)
            vim.keymap.set("n", "<C-v>", function()
                harpoon.ui:select_menu_item({ vsplit = true })
            end, { buffer = ctx.bufnr })

            vim.keymap.set("n", "<C-s>", function()
                harpoon.ui:select_menu_item({ split = true })
            end, { buffer = ctx.bufnr })

            vim.keymap.set("n", "<C-t>", function()
                harpoon.ui:select_menu_item({ tabedit = true })
            end, { buffer = ctx.bufnr })
        end,
    })
end

M.keys = {
    {
        "<leader>mm",
        function()
            require("harpoon"):list():add()

            vim.notify(
                "File '" .. vim.fn.expand("%:.") .. "' added to Harpoon",
                vim.log.levels.INFO
            )
        end,
        desc = "(Harpoon) Add current file to Harpoon list",
    },
    {
        "<leader>fm",
        function()
            require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
        end,
        desc = "(Harpoon) Add current file to Harpoon list",
    },
    {
        "<leader>ma",
        function()
            require("harpoon"):list():select(1)
        end,
        desc = "(Harpoon) Navigate to 1st item",
    },
    {
        "<leader>ms",
        function()
            require("harpoon"):list():select(2)
        end,
        desc = "(Harpoon) Navigate to 2nd item",
    },
    {
        "<leader>md",
        function()
            require("harpoon"):list():select(3)
        end,
        desc = "(Harpoon) Navigate to 3rd item",
    },
    {
        "<leader>mf",
        function()
            require("harpoon"):list():select(4)
        end,
        desc = "(Harpoon) Navigate to 4th item",
    },
    {
        "<leader>mg",
        function()
            require("harpoon"):list():select(5)
        end,
        desc = "(Harpoon) Navigate to 5th item",
    },
}

return M
