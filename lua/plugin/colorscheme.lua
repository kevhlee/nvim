local M = {
    'ellisonleao/gruvbox.nvim', -- Placeholder
    name = 'colorscheme',
    dependencies = {
        'rose-pine/neovim',
        'nyoom-engineering/oxocarbon.nvim',
        'srcery-colors/srcery-vim',
    },
    config = function()
        local configs = {}

        configs.gruvbox = function()
            if not pcall(require, 'gruvbox') then
                return
            end

            require('gruvbox').setup {
                bold = true,
                italic = {
                    comments = true,
                },
                transparent_mode = true,
            }

            vim.cmd [[colorscheme gruvbox]]
        end

        configs.oxocarbon = function()
            vim.cmd [[colorscheme oxocarbon]]
        end

        configs.rose_pine = function()
            if not pcall(require, 'rose-pine') then
                return
            end

            require('rose-pine').setup {
                dark_variant = 'moon', -- main, moon
                dim_nc_background = false,
                disable_background = false,
                disable_float_background = false,
                disable_italics = true,
            }

            vim.cmd [[colorscheme rose-pine]]
        end

        configs.srcery = function()
            vim.cmd [[colorscheme srcery]]
        end

        local config = configs.rose_pine
        if config ~= nil then
            -- Make background transparent
            vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
            vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

            config()
        end
    end,
}

return M
