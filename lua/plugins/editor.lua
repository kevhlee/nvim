local M = {}

--
-- Buffers
--

table.insert(M, {
    "tpope/vim-sleuth",
    event = { "BufReadPre", "BufNewFile" },
})

--
-- Comments
--

table.insert(M, {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("Comment").setup({
            padding = true,
            mappings = {
                basic = true,
            },
        })

        require("Comment.ft").set("json", { "//%s", "/*%s*/" })
    end,
})

--
-- Colors
--

table.insert(M, {
    "echasnovski/mini.hipatterns",
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
        return {
            highlighters = {
                fixme = {
                    pattern = "%f[%w]()FIXME()%f[%W]",
                    group = "MiniHipatternsFixme",
                },
                hack = {
                    pattern = "%f[%w]()HACK()%f[%W]",
                    group = "MiniHipatternsHack",
                },
                todo = {
                    pattern = "%f[%w]()TODO()%f[%W]",
                    group = "MiniHipatternsTodo",
                },
                note = {
                    pattern = "%f[%w]()NOTE()%f[%W]",
                    group = "MiniHipatternsNote",
                },
                hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
            },
        }
    end,
})

--
-- Indent guides
--

table.insert(M, {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        scope = {
            enabled = true,
            include = {
                node_type = {
                    ["*"] = { "*" },
                },
            },
        },
    },
})

--
-- Statusline
--

table.insert(M, {
    "nvim-lualine/lualine.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
    },
    opts = {
        options = {
            component_separators = "",
            section_separators = "",
            globalstatus = true,
            ignore_focus = { "TelescopePrompt" },
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            },
            theme = "auto",
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = {
                { "filename", path = 1 },
            },
            lualine_x = { "encoding", "fileformat", "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
    },
})

--
-- Syntax highlighting
--

table.insert(M, {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                "json",
                "lua",
                "markdown",
                "python",
                "vim",
                "vimdoc",
                "xml",
            },
            auto_install = false,
            highlight = {
                enable = true,
                disable = {},
            },
        })
    end,
})

--
-- Winbar
--

table.insert(M, {
    "utilyre/barbecue.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "SmiteshP/nvim-navic" },
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        require("barbecue").setup({
            attach_navic = false,
        })

        require("lsp").add_to_attach(function(client, bufnr)
            if client.server_capabilities.documentSymbolProvider then
                require("nvim-navic").attach(client, bufnr)
            end
        end)
    end,
})

return M
