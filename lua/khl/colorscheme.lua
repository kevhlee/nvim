local configs = {}

configs.darcula_solid = function()
    vim.cmd [[colorscheme darcula-solid]]
end

configs.gruvbox = function()
    local ok, gruvbox = pcall(require, 'gruvbox')
    if not ok then
        return
    end

    gruvbox.setup {
        bold = true,
        italic = {
            comments = true,
        },
        transparent_mode = true,
    }

    vim.cmd [[colorscheme gruvbox]]
end

configs.material = function()
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
end

configs.oxocarbon = function()
    vim.cmd [[colorscheme oxocarbon]]
end

configs.rose_pine = function()
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
end

configs.srcery = function()
    vim.cmd [[colorscheme srcery]]
end

-- Make background transparent
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

local config = configs.darcula_solid
if config ~= nil then
    config()
end
