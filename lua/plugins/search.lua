local M = {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        { "nvim-telescope/telescope-ui-select.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-tree/nvim-web-devicons" },
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
    })

    require("telescope").load_extension("ui-select")

    require("lsp").add_to_attach(function(_, bufnr)
        local opts = { buffer = bufnr }

        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definition<cr>", opts)
        vim.keymap.set(
            "n",
            "gi",
            "<cmd>Telescope lsp_implementations<cr>",
            opts
        )
        vim.keymap.set(
            "n",
            "go",
            "<cmd>Telescope lsp_type_definitions<cr>",
            opts
        )
        vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
    end)
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
    {
        "<leader>f'",
        "<cmd>Telescope git_status<cr>",
        desc = "(Telescope) Display Git status",
    },
    {
        "<leader>f/",
        "<cmd>Telescope git_branches<cr>",
        desc = "(Telescope) Display Git branches",
    },
}

return M
