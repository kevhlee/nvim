local M = {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        { "nvim-treesitter/nvim-treesitter-textobjects" },
    },
    build = ":TSUpdate",
    cmd = {
        "TSInstall",
        "TSInstallFromGrammar",
        "TSInstallInfo",
        "TSInstallSync",
        "TSModuleInfo",
        "TSUninstall",
        "TSUpdate",
        "TSUpdateSync",
    },
    event = "BufReadPost",
}

M.config = function()
    require("nvim-treesitter.configs").setup({
        ensure_installed = {
            "bash",
            "git_config",
            "git_rebase",
            "gitattributes",
            "gitcommit",
            "gitignore",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "vim",
            "vimdoc",
            "yaml",
        },
        highlight = {
            enable = true,
            disable = function(_, bufnr)
                -- Ignore buffers with more than 20,000 lines
                return vim.api.nvim_buf_line_count(bufnr) > 20000
            end,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn",
                node_incremental = "grn",
                node_decremental = "grm",
                scope_incremental = "grc",
            },
        },
        textobjects = {
            move = {
                enable = true,
                goto_next_start = {
                    ["]f"] = "@function.outer",
                    ["]c"] = "@class.outer",
                },
                goto_previous_start = {
                    ["[f"] = "@function.outer",
                    ["[c"] = "@class.outer",
                },
            },
            select = {
                enable = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                    ["ap"] = "@parameter.outer",
                    ["ip"] = "@parameter.inner",
                },
            },
        },
    })

    -- This is a dedicated command to install a Treesitter parser based on the
    -- current buffer's filetype information.

    vim.api.nvim_create_user_command("TSInstallInferFromBuffer", function()
        local ft = vim.bo.filetype
        local lang = vim.treesitter.language.get_lang(ft)
        if not lang then
            ft = vim.split(ft, ".", { plain = true })[1]
            lang = vim.treesitter.language.get_lang(ft) or ft
        end
        vim.cmd("TSInstall " .. lang)
    end, {
        desc = "Install Treesitter parser for current buffer's filetype",
    })
end

M.keys = {
    {
        "<leader>ts",
        "<Cmd>InspectTree<CR>",
        desc = "(Treesitter) Start Treesitter playground",
    },
}

return M
