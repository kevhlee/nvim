local M = {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    pin = true,
    dependencies = {
        { "nvim-lua/plenary.nvim", pin = true },
        { "nvim-telescope/telescope-file-browser.nvim", pin = true },
        { "nvim-telescope/telescope-ui-select.nvim", pin = true },
        { "nvim-telescope/telescope-fzf-native.nvim", pin = true, build = "make" },
    },
}

M.config = function()
    require("telescope").setup({
        defaults = {
            file_ignore_patterns = {
                ".DS_Store",
                "^.git/",
                "^node_modules/",
            },
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.55,
                    results_width = 0.9,
                },
            },
            layout_strategy = "horizontal",
            prompt_prefix = "🔭 ",
            sorting_strategy = "ascending",
        },
        pickers = {
            find_files = {
                hidden = true,
                no_ignore = false,
            },
            live_grep = {
                max_results = 100,
            },
        },
        extensions = {
            file_browser = {
                hidden = true,
                hijack_netrw = false,
                respect_gitignore = false,
                initial_mode = "normal",
                git_status = false,
            },
        },
    })

    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("ui-select")

    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
    vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
    vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>")
    vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
    vim.keymap.set("n", "<leader>fr", "<cmd>Telescope registers<cr>")
    vim.keymap.set("n", "<leader>f/", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>")
    vim.keymap.set("n", "<leader>f?", "<cmd>Telescope file_browser<cr>")

    vim.keymap.set("n", "<leader>f'", "<cmd>Telescope git_status<cr>")
    vim.keymap.set("n", "<leader>f;", "<cmd>Telescope git_bcommits<cr>")
    vim.keymap.set("n", "<leader>f:", "<cmd>Telescope git_branches<cr>")
end

return M
