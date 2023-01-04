local ok, dap = pcall(require, 'dap')
if not ok then
  return
end

vim.keymap.set('n', '<leader>bs', dap.continue)
vim.keymap.set('n', '<leader>br', dap.restart)
vim.keymap.set('n', '<leader>bl', dap.step_over)
vim.keymap.set('n', '<leader>bj', dap.step_into)
vim.keymap.set('n', '<leader>bk', dap.step_out)
vim.keymap.set('n', '<leader>bt', dap.terminate)
vim.keymap.set('n', '<leader>bc', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>bC', function()
  dap.toggle_breakpoint(vim.fn.input 'Breakpoint condition: ')
end)

-- ##
-- ## Go
-- ##

dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = { 'dap', '-l', '127.0.0.1:${port}' },
  },
}

dap.configurations.go = {
  {
    type = 'delve',
    name = 'Debug',
    request = 'launch',
    program = '${file}',
  },
  {
    type = 'delve',
    name = 'Debug test',
    request = 'launch',
    mode = 'test',
    program = '${file}',
  },
  {
    type = 'delve',
    name = 'Debug test (go.mod)',
    request = 'launch',
    mode = 'test',
    program = './${relativeFileDirname}',
  },
}

local ui_ok, ui = pcall(require, 'dapui')
if not ui_ok then
  return
end

ui.setup {
  layouts = {
    {
      elements = {
        'scopes',
        'breakpoints',
        'stacks',
        'watches',
      },
      size = 40,
      position = 'left',
    },
    {
      elements = {
        'repl',
        'console',
      },
      size = 10,
      position = 'bottom',
    },
  },
}

vim.keymap.set('n', '<leader>bb', ui.toggle)
