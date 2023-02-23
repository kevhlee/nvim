local M = {}

M.setup = function(config)
    local colorscheme = config.colorscheme
    if colorscheme == nil then
        colorscheme = 'material'
    end

    local colorscheme_configs = {
        adwaita = function()
            vim.cmd [[colorscheme adwaita]]
        end,
        ayu = function()
            local ok, ayu = pcall(require, 'ayu')
            if not ok then
                return
            end

            ayu.setup {
                mirage = false,
            }

            vim.cmd [[colorscheme ayu]]
        end,
        darcula = function()
            vim.cmd [[colorscheme darcula]]
        end,
        dracula = function()
            vim.cmd [[colorscheme dracula]]
        end,
        gruvbox = function()
            local ok, gruvbox = pcall(require, 'gruvbox')
            if not ok then
                return
            end

            gruvbox.setup {
                bold = true,
                italic = true,
                transparent_mode = true,
            }

            vim.cmd [[colorscheme gruvbox]]
        end,
        kanagawa = function()
            local ok, kanagawa = pcall(require, 'kanagawa')
            if not ok then
                return
            end

            kanagawa.setup {
                theme = "default",
                commentStyle = { italic = true },
                keywordStyle = { bold = true, italic = true },
                specialReturn = true,
                specialException = true,
                transparent = true,
                dimInactive = false, -- dim inactive window `:h hl-NormalNC`
                globalStatus = false, -- adjust window separators highlight for laststatus=3
                terminalColors = true,
            }

            vim.cmd [[colorscheme kanagawa]]
        end,
        material = function()
            local ok, material = pcall(require, 'material')
            if not ok then
                return
            end

            material.setup {
                styles = {
                    comments = { italic = true },
                    keywords = { italic = true },
                },
                plugins = {
                    'dap',
                    'gitsigns',
                    'indent-blankline',
                    'nvim-cmp',
                    'nvim-tree',
                    'nvim-web-devicons',
                    'telescope',
                },
            }

            vim.cmd [[colorscheme material]]
        end,
        melange = function()
            vim.cmd [[colorscheme melange]]
        end,
        oxocarbon = function()
            vim.cmd [[colorscheme oxocarbon]]
        end,
        rose_pine = function()
            local ok, rose_pine = pcall(require, 'rose-pine')
            if not ok then
                return
            end

            rose_pine.setup {
                dark_variant = 'moon', -- main, moon
                dim_nc_background = false,
                disable_background = false,
                disable_float_background = false,
                disable_italics = true,
            }

            vim.cmd [[colorscheme rose-pine]]
        end,
        sobrio = function()
            vim.cmd [[colorscheme sobrio]]
        end,
        srcery = function()
            vim.cmd [[colorscheme srcery]]
        end,
    }

    -- Make background transparent
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

    local colorscheme_config = colorscheme_configs[colorscheme]
    if colorscheme_config ~= nil then
        colorscheme_config()
    end
end

return M
