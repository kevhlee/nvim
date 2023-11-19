return {
    "ThePrimeagen/harpoon",
    pin = true,
    dependencies = { "nvim-lua/plenary.nvim", pin = true },
    config = function()
        require("harpoon").setup()

        vim.keymap.set("n", "<leader>mm", function()
            local relative_filepath = vim.fn.expand("%:.")
            require("harpoon.mark").add_file(relative_filepath)
            print("Mark added for", relative_filepath)
        end)

        vim.keymap.set("n", "<leader>fm", require("harpoon.ui").toggle_quick_menu)
    end,
}
