local plugins = {}

table.insert(plugins, 'tpope/vim-fugitive')

table.insert(plugins, {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require('nvim-treesitter.configs').setup {
            auto_install = true,
            ensure_installed = {
                'lua',
                'markdown',
                'vim',
            },
            highlight = {
                enable = true,
            },
        }
    end,
})

table.insert(plugins, {
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
})

table.insert(plugins, {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
        require('indent_blankline').setup {
            show_current_context = true,
            show_current_context_start = true,
            char = '▏',
            context_char = '▏',
        }
    end,
})

table.insert(plugins, {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'arkav/lualine-lsp-progress',
    },
    config = function()
        require('lualine').setup {
            options = {
                theme = 'auto',
                icons_enabled = true,
                globalstatus = true,
                component_separators = { left = '', right = '' },
                section_separators = {
                    left = '',
                    right = '',
                    -- left = '', right = '',
                    -- left = '', right = '',
                },
                ignore_focus = {
                    'NvimTree',
                },
                disabled_filetypes = {
                    statusline = {
                        'alpha',
                        'packer',
                    },
                    winbar = {
                        'alpha',
                        'packer',
                    },
                },
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = {
                    { 'filename', path = 1 },
                    {
                        'lsp_progress',
                        separators = {
                            component = ' ',
                            progress = ' | ',
                            percentage = { pre = '', post = '%% ' },
                            title = { pre = '', post = ': ' },
                            lsp_client_name = { pre = '[', post = ']' },
                            spinner = { pre = '', post = '' },
                            message = {
                                commenced = 'In Progress',
                                completed = 'Completed',
                            },
                        },
                        display_components = {
                            'lsp_client_name',
                            'spinner',
                            { 'title', 'percentage', 'message' },
                        },
                        spinner_symbols = {
                            '⣾',
                            '⣽',
                            '⣻',
                            '⢿',
                            '⡿',
                            '⣟',
                            '⣯',
                            '⣷',
                        },
                    },
                },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' },
            },
            extensions = {
                'fugitive',
                'nvim-dap-ui',
                'nvim-tree',
            },
        }
    end,
})

table.insert(plugins, {
    'nvim-tree/nvim-tree.lua',
    config = function()
        require('nvim-tree').setup {
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
            diagnostics = {
                enable = false,
            },
            update_focused_file = {
                enable = true,
                update_cwd = false,
            },
            git = {
                enable = true,
                ignore = false,
            },
            filesystem_watchers = {
                enable = true,
            },
            renderer = {
                indent_markers = {
                    enable = true,
                },
                highlight_git = true,
            },
        }

        vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<cr>')
        vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeFocus<cr>')
    end,
})

table.insert(plugins, {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
})

table.insert(plugins, {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
    },
    config = function()
        require('telescope').setup {
            defaults = {
                color_devicons = true,
                winblend = 0,
                prompt_prefix = '🔭 ',
                sorting_strategy = 'ascending',
                selection_strategy = 'reset',
                layout_strategy = 'horizontal',
                layout_config = {
                    horizontal = {
                        prompt_position = 'top',
                        preview_width = 0.55,
                        results_width = 0.9,
                    },
                    vertical = {
                        prompt_position = 'top',
                        mirror = true,
                    },
                },
                file_ignore_patterns = {
                    '.DS_Store',
                    '.git/',
                    'node_modules/',
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
                live_grep = {
                    hidden = true,
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                },
                file_browser = {
                    hijack_netrw = false,
                    hidden = true,
                    respect_gitignore = false,
                },
            },
        }

        -- ##
        -- ## Extensions
        -- ##

        require('telescope').load_extension 'fzf'
        require('telescope').load_extension 'file_browser'

        -- ##
        -- ## Keymaps
        -- ##

        local keymap = vim.keymap

        keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
        keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
        keymap.set('n', '<leader>fj', '<cmd>Telescope jumplist<cr>')
        keymap.set('n', '<leader>fm', '<cmd>Telescope marks<cr>')
        keymap.set('n', '<leader>fk', '<cmd>Telescope keymaps<cr>')
        keymap.set('n', '<leader>fr', '<cmd>Telescope registers<cr>')
        keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
        keymap.set('n', '<leader>f/', '<cmd>Telescope file_browser<cr>')

        keymap.set('n', '<leader>ggc', '<cmd>Telescope git_commits<cr>')
        keymap.set('n', '<leader>ggb', '<cmd>Telescope git_branches<cr>')
        keymap.set('n', '<leader>ggs', '<cmd>Telescope git_status<cr>')
        keymap.set('n', '<leader>ggt', '<cmd>Telescope git_stash<cr>')
        keymap.set('n', '<leader>ggf', '<cmd>Telescope git_files<cr>')
    end,
})

table.insert(plugins, {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
        -- LSP Support
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- Autocompletion
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',

        -- Snippets
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',
    },
    config = function()
        require 'lsp'
    end,
})

local ok, custom = pcall(require, 'custom.plugins')
if ok then
    for _, plugin in ipairs(custom) do
        table.insert(plugins, plugin)
    end
end

local lazy_path = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazy_path) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazy_path,
    }
end

vim.opt.rtp:prepend(lazy_path)

require('lazy').setup(plugins)
