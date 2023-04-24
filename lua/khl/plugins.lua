local bootstrap_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system {
            'git',
            'clone',
            '--depth',
            '1',
            'https://github.com/wbthomason/packer.nvim',
            install_path,
        }
        vim.cmd [[packadd packer.nvim]]
        return true
    end

    return false
end

local bootstrap = bootstrap_packer()
local packer = require 'packer'

packer.init {
    auto_clean = true,
    compile_on_sync = true,
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'single' }
        end,
    },
}

packer.startup(function(use)
    use { 'wbthomason/packer.nvim' }

    use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'nvim-telescope/telescope-file-browser.nvim' }

    use {
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
    }
    use { 'tpope/vim-fugitive' }
    use { 'lewis6991/gitsigns.nvim' }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('nvim-tree').setup {
                hijack_netrw = false,
                hijack_cursor = true,
                open_on_setup = false,
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

            vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<cr>')
            vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeFocus<cr>')
        end,
    }

    use { 'nvim-lualine/lualine.nvim', requires = 'arkav/lualine-lsp-progress' }

    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('indent_blankline').setup {
                show_current_context = true,
                show_current_context_start = true,
                char = '▏',
                context_char = '▏',
            }
        end,
    }

    use {
        'Pocco81/true-zen.nvim',
        requires = 'folke/twilight.nvim',
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
                        font = '+0',
                    },
                },
            }

            vim.keymap.set('n', '<leader>tz', '<cmd>TZAtaraxis<cr>')
        end,
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-treesitter.configs').setup {
                auto_install = true,
                ensure_installed = {
                    'c',
                    'lua',
                    'markdown',
                    'rust',
                    'vim',
                },
                highlight = {
                    enable = true,
                },
            }
        end,
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        },
    }

    use { 'scalameta/nvim-metals', requires = 'nvim-lua/plenary.nvim' }
    use { 'mfussenegger/nvim-dap', requires = 'rcarriga/nvim-dap-ui' }

    use { 'briones-gabriel/darcula-solid.nvim', requires = 'rktjmp/lush.nvim' }
    use { 'ellisonleao/gruvbox.nvim' }
    use { 'savq/melange' }
    use { 'rose-pine/neovim', as = 'rose-pine' }
    use { 'nyoom-engineering/oxocarbon.nvim' }
    use { 'srcery-colors/srcery-vim', as = 'srcery' }

    if bootstrap then
        packer.sync()
    end
end)
