local M = {}

table.insert(M, {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup {
            padding = true,
            mappings = {
                basic = true,
            },
        }

        require('Comment.ft').set('json', { '//%s', '/*%s*/' })
    end,
})

table.insert(M, {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('harpoon').setup()

        vim.keymap.set('n', '<leader>mm', function()
            local relative_filepath = vim.fn.expand '%:.'
            require('harpoon.mark').add_file(relative_filepath)
            print('Mark added for', relative_filepath)
        end)

        vim.keymap.set(
            'n',
            '<leader>fm',
            require('harpoon.ui').toggle_quick_menu
        )
    end,
})

table.insert(M, {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'nvim-telescope/telescope-ui-select.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        local telescope = require 'telescope'

        telescope.setup {
            defaults = {
                color_devicons = false,
                prompt_prefix = '🔭 ',
                sorting_strategy = 'ascending',
                layout_strategy = 'horizontal',
                layout_config = {
                    horizontal = {
                        prompt_position = 'top',
                        preview_width = 0.55,
                        results_width = 0.9,
                    },
                },
                file_ignore_patterns = {
                    '.DS_Store',
                    '.cache/',
                    '.git/',
                    'node_modules/',
                },
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
                    initial_mode = 'normal',
                },
            },
        }

        telescope.load_extension 'fzf'
        telescope.load_extension 'file_browser'
        telescope.load_extension 'ui-select'

        vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
        vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
        vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
        vim.keymap.set('n', '<leader>fk', '<cmd>Telescope keymaps<cr>')
        vim.keymap.set(
            'n',
            '<leader>f/',
            '<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>'
        )
        vim.keymap.set('n', '<leader>f?', '<cmd>Telescope file_browser<cr>')
        vim.keymap.set('n', '<leader>ggc', '<cmd>Telescope git_commits<cr>')
        vim.keymap.set('n', '<leader>ggb', '<cmd>Telescope git_bcommits<cr>')
        vim.keymap.set('n', '<leader>ggs', '<cmd>Telescope git_status<cr>')

        -- See https://github.com/nvim-telescope/telescope.nvim/issues/559

        vim.api.nvim_create_autocmd('BufRead', {
            callback = function()
                vim.api.nvim_create_autocmd('BufWinEnter', {
                    once = true,
                    command = 'normal! zx',
                })
            end,
        })
    end,
})

table.insert(M, {
    'pocco81/true-zen.nvim',
    dependencies = { 'folke/twilight.nvim' },
    config = function()
        require('true-zen').setup {
            modes = {
                ataraxis = {
                    shade = 'dark',
                    backdrop = 0,
                    quit_untoggles = true,
                    callbacks = {
                        open_pre = function()
                            require('barbecue.ui').toggle(false)
                        end,
                        close_pos = function()
                            require('barbecue.ui').toggle(true)
                        end,
                    },
                },
            },
            integrations = {
                tmux = true,
                twilight = true,
                lualine = true,
                kitty = {
                    enabled = true,
                    font = '+1',
                },
            },
        }

        vim.keymap.set('n', '<leader>tz', '<cmd>TZAtaraxis<cr>')
    end,
})

return M