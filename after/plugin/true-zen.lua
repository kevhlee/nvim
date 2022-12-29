local ok, true_zen = pcall(require, 'true-zen')
if not ok then
  return
end

true_zen.setup {
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
      font = '+3',
    },
  },
}

vim.keymap.set('n', '<leader>tz', '<cmd>TZAtaraxis<cr>')
