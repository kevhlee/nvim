local M = {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-tree/nvim-web-devicons" },
    },
}

M.opts = function()
    return {
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
            mappings = {
                i = {
                    ["<C-j>"] = require("telescope.actions").cycle_history_next,
                    ["<C-k>"] = require("telescope.actions").cycle_history_prev,
                },
            },
            sorting_strategy = "ascending",
        },
        pickers = {
            find_files = {
                hidden = true,
                no_ignore = false,
            },
            live_grep = {
                max_results = 999,
            },
        },
    }
end

M.keys = {
    {
        "<leader>F",
        "<cmd>Telescope resume<cr>",
        desc = "(Telescope) Resume previous search",
    },
    {
        "<leader>ff",
        "<cmd>Telescope find_files<cr>",
        desc = "(Telescope) Search for files",
    },
    {
        "<leader>fg",
        "<cmd>Telescope live_grep<cr>",
        desc = "(Telescope) Search for patterns in files",
    },
    {
        "<leader>fk",
        "<cmd>Telescope keymaps<cr>",
        desc = "(Telescope) Display key mappings",
    },
    {
        "<leader>fb",
        "<cmd>Telescope buffers<cr>",
        desc = "(Telescope) Display current buffers",
    },
    {
        "<leader>fr",
        "<cmd>Telescope registers<cr>",
        desc = "(Telescope) Display contents of registers",
    },
    {
        "<leader>fd",
        "<cmd>Telescope diagnostics<cr>",
        desc = "(Telescope) Display diagnostics",
    },
}

return M
