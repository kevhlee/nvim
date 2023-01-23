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
    use { 'lewis6991/impatient.nvim' }

    use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'nvim-telescope/telescope-file-browser.nvim' }

    use { 'numToStr/Comment.nvim' }
    use { 'tpope/vim-fugitive' }
    use { 'lewis6991/gitsigns.nvim' }

    use { 'nvim-tree/nvim-tree.lua' }
    use { 'nvim-tree/nvim-web-devicons' }
    use { 'nvim-lualine/lualine.nvim' }
    use { 'arkav/lualine-lsp-progress' }
    use { 'lukas-reineke/indent-blankline.nvim' }
    use {
        'akinsho/bufferline.nvim',
        tag = 'v3.*',
        requires = 'nvim-tree/nvim-web-devicons',
    }
    use { 'tiagovla/scope.nvim' }
    use { 'folke/twilight.nvim' }
    use { 'Pocco81/true-zen.nvim' }

    use { 'nvim-treesitter/nvim-treesitter' }

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
            -- { 'rafamadriz/friendly-snippets' },
        },
    }

    use 'Olical/conjure'

    use { 'mfussenegger/nvim-dap' }
    use { 'rcarriga/nvim-dap-ui', requires = 'mfussenegger/nvim-dap' }

    use { 'Shatur/neovim-ayu' }
    use { 'marko-cerovac/material.nvim' }
    use { 'savq/melange' }
    use { 'nyoom-engineering/oxocarbon.nvim' }
    use { 'srcery-colors/srcery-vim', as = 'srcery' }

    if bootstrap then
        packer.sync()
    end
end)
