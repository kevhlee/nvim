local M = {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
    },
}

M.config = function()
    local harpoon = require("harpoon")

    harpoon.setup({
        settings = {
            sync_on_toggle = false,
            sync_on_ui_close = false,
        },
    })

    harpoon:extend({
        UI_CREATE = function(ctx)
            vim.keymap.set("n", "<C-v>", function()
                harpoon.ui:select_menu_item({ vsplit = true })
            end, { buffer = ctx.bufnr })

            vim.keymap.set("n", "<C-x>", function()
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
                "Mark added for " .. vim.fn.expand("%:."),
                vim.log.levels.INFO
            )
        end,
        desc = "(Harpoon) Mark current file",
    },
    {
        "<leader>fm",
        function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "(Harpoon) Display marks",
    },
}

return M
