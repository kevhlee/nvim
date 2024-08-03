local M = {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    branch = "harpoon2",
    lazy = true,
    event = "VeryLazy",
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

    vim.keymap.set("n", "<leader>mm", function()
        harpoon:list():add()
        print("Mark added for", vim.fn.expand("%:."))
    end)

    vim.keymap.set("n", "<leader>fm", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
end

return M
