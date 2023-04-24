local M = {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        lazy = true,
        keys = {
            { '<leader>ff', '<cmd>Telescope find_files<cr>' },
            { '<leader>fg', '<cmd>Telescope live_grep<cr>' },
            { '<leader>fj', '<cmd>Telescope jumplist<cr>' },
            { '<leader>fm', '<cmd>Telescope marks<cr>' },
            { '<leader>fk', '<cmd>Telescope keymaps<cr>' },
            { '<leader>fr', '<cmd>Telescope registers<cr>' },
            { '<leader>fo', '<cmd>Telescope oldfiles<cr>' },
            { '<leader>fb', '<cmd>Telescope buffers<cr>' },
            { '<leader>f/', '<cmd>Telescope file_browser<cr>' },
            { '<leader>ggc', '<cmd>Telescope git_commits<cr>' },
            { '<leader>ggb', '<cmd>Telescope git_branch<cr>' },
            { '<leader>ggs', '<cmd>Telescope git_status<cr>' },
        },
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', lazy = true },
    { 'nvim-telescope/telescope-file-browser.nvim', lazy = true },
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-treesitter.configs').setup {
                auto_install = true,
                ensure_installed = {
                    'c',
                    'lua',
                    'markdown',
                    'vim',
                },
                highlight = {
                    enable = true,
                },
            }
        end,
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup {
                padding = true,
                mappings = {
                    basic = true,
                },
            }

            local ft = require 'Comment.ft'

            ft.set('json', { '//%s', '/*%s*/' })
        end,
        lazy = true,
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('indent_blankline').setup {
                show_current_context = true,
                show_current_context_start = true,
                char = '▏',
                context_char = '▏',
            }
        end,
    },
    {
        'Pocco81/true-zen.nvim',
        dependencies = { 'folke/twilight.nvim' },
        lazy = true,
        keys = {
            { '<leader>tz', '<cmd>TZAtaraxis<cr>' },
        },
        config = function()
            require('true-zen').setup {
                modes = {
                    ataraxis = {
                        shade = 'dark',
                        backdrop = 0,
                        quit_untoggles = true,
                    },
                },
                integrations = {
                    tmux = true,
                    twilight = true,
                    lualine = true,
                    kitty = {
                        enabled = true,
                        font = '+2',
                    },
                },
            }
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = 'arkav/lualine-lsp-progress',
    },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = 'nvim-tree/nvim-web-devicons',
        keys = {
            { '<C-n>', '<cmd>NvimTreeToggle<cr>' },
            { '<leader>n', '<cmd>NvimTreeFocus<cr>' },
        },
        config = function()
            require('nvim-tree').setup {
                hijack_netrw = false,
                hijack_cursor = true,
                view = {
                    side = 'left',
                    adaptive_size = true,
                },
                filters = {
                    custom = {
                        '\\.DS_Store',
                        '\\.git/',
                        'node_modules/*',
                    },
                },
                update_focused_file = {
                    enable = true,
                    update_cwd = false,
                },
                git = {
                    enable = true,
                    ignore = false,
                },
                filesystem_watchers = { enable = true },
                renderer = {
                    indent_markers = { enable = true },
                    highlight_git = true,
                },
            }
        end,
    },
}

return M
