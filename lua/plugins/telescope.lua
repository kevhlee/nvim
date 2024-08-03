local M = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
    },
}

M.config = function()
    local telescope = require("telescope")

    telescope.setup({
        defaults = {
            file_ignore_patterns = {
                ".DS_Store",
                "^.git/",
                "^node_modules/",
            },
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                },
            },
            layout_strategy = "horizontal",
            sorting_strategy = "ascending",
        },
        pickers = {
            find_files = {
                hidden = true,
                no_ignore = false,
            },
            live_grep = {
                max_results = 1000,
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

    telescope.load_extension("file_browser")
    telescope.load_extension("ui-select")

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
