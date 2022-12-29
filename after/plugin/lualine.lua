local ok, lualine = pcall(require, 'lualine')
if not ok then
  return
end

lualine.setup {
  options = {
    theme = 'auto',
    icons_enabled = true,
    -- globalstatus = true,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
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
  extensions = {
    'fugitive',
    'nvim-dap-ui',
    'nvim-tree',
  },
}
