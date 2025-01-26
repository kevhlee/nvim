local M = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-live-grep-args.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "nvim-telescope/telescope-project.nvim" },
    },
    cmd = "Telescope",
}

M.config = function()
    require("telescope").setup({
        defaults = {
            file_ignore_patterns = {
                "^.git/",
                "^node_modules/",
            },
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                },
            },
            mappings = {
                n = {
                    ["<C-x>"] = false,
                    ["<C-s>"] = "select_horizontal",
                    ["<C-j>"] = "cycle_history_next",
                    ["<C-k>"] = "cycle_history_prev",
                    ["<C-l>"] = "send_to_loclist",
                },
                i = {
                    ["<C-x>"] = false,
                    ["<C-s>"] = "select_horizontal",
                    ["<C-j>"] = "cycle_history_next",
                    ["<C-k>"] = "cycle_history_prev",
                    ["<C-l>"] = "send_to_loclist",
                },
            },
            sorting_strategy = "ascending",
        },
        pickers = {
            buffers = {
                mappings = {
                    n = {
                        ["<C-d>"] = "delete_buffer",
                    },
                    i = {
                        ["<C-d>"] = "delete_buffer",
                    },
                },
            },
            find_files = {
                hidden = true,
                layout_strategy = "center",
                layout_config = {
                    anchor = "N",
                    width = 0.75,
                },
            },
            live_grep = {
                max_results = 200,
                layout_strategy = "center",
                layout_config = {
                    anchor = "N",
                    width = 0.75,
                },
            },
        },
        extensions = {
            project = {
                hidden_files = true,
                theme = "ivy",
                on_project_selected = function(prompt_buf)
                    local actions =
                        require("telescope._extensions.project.actions")

                    local selected_path = actions.get_selected_path(prompt_buf)

                    actions.change_working_directory(prompt_buf)

                    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                        if vim.api.nvim_buf_is_loaded(buf) then
                            vim.api.nvim_buf_delete(buf, { force = true })
                        end
                    end

                    require("oil").open(selected_path)
                end,
            },
        },
    })

    require("telescope").load_extension("fzf")
    require("telescope").load_extension("live_grep_args")
    require("telescope").load_extension("project")
end

M.keys = {
    {
        "<leader>F",
        "<Cmd>Telescope resume<CR>",
        desc = "(Telescope) Resume previous search",
    },
    {
        "<leader>ff",
        "<Cmd>Telescope find_files<CR>",
        desc = "(Telescope) Search for files",
    },
    {
        "<leader>fg",
        "<Cmd>Telescope live_grep<CR>",
        desc = "(Telescope) Search for a string and get results live",
    },
    {
        "<leader>fG",
        function()
            require("telescope").extensions.live_grep_args.live_grep_args()
        end,
        desc = "(Telescope) Search for a string using ripgrep arguments and get results live",
    },
    {
        "<leader>fs",
        "<Cmd>Telescope grep_string<CR>",
        mode = { "n", "v" },
        desc = "(Telescope) Search for the string under the cursor and filter out results",
    },
    {
        "<leader>fb",
        "<Cmd>Telescope buffers<CR>",
        desc = "(Telescope) List open buffers",
    },
    {
        "<leader>fr",
        "<Cmd>Telescope registers<CR>",
        desc = "(Telescope) List the contents of a register and pastes it",
    },
    {
        "<leader>fd",
        "<Cmd>Telescope diagnostics<CR>",
        desc = "(Telescope) List diagnostics",
    },
    {
        "<leader>fk",
        "<Cmd>Telescope keymaps<CR>",
        desc = "(Telescope) List registered key mappings",
    },
    {
        "<leader>ft",
        "<Cmd>Telescope treesitter<CR>",
        desc = "(Telescope) List symbols from Treesitter queries",
    },
    {
        "<leader>fp",
        function()
            require("telescope").extensions.project.project({
                display_type = "full",
                hide_workspace = true,
            })
        end,
        desc = "(Telescope) List projects",
    },

    -- Git

    {
        "<leader>f'",
        "<Cmd>Telescope git_status<CR>",
        desc = "(Telescope) List Git status",
    },
    {
        "<leader>f/",
        "<Cmd>Telescope git_bcommits<CR>",
        desc = "(Telescope) List Git commits for current buffer",
    },
    {
        "<leader>f/",
        "<Cmd>Telescope git_bcommits_range<CR>",
        mode = "v",
        desc = "(Telescope) List Git commits for the lines under the cursor",
    },
    {
        "<leader>f;",
        "<Cmd>Telescope git_branches<CR>",
        desc = "(Telescope) List Git branches",
    },
}

return M
