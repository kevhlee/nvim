local colorscheme = 'melange'

local configs = {
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
  srcery = function()
    vim.cmd [[colorscheme srcery]]
  end,
}

-- Make background transparent
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

local config = configs[colorscheme]
if config ~= nil then
  config()
end
