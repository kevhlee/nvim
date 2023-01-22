local ok, plugin = pcall(require, 'dap')
if not ok then
    return
end

vim.keymap.set('n', '<leader>bs', plugin.continue)
vim.keymap.set('n', '<leader>br', plugin.restart)
vim.keymap.set('n', '<leader>bl', plugin.step_over)
vim.keymap.set('n', '<leader>bj', plugin.step_into)
vim.keymap.set('n', '<leader>bk', plugin.step_out)
vim.keymap.set('n', '<leader>bt', plugin.terminate)
vim.keymap.set('n', '<leader>bc', plugin.toggle_breakpoint)
vim.keymap.set('n', '<leader>bC', function()
    plugin.toggle_breakpoint(vim.fn.input 'Breakpoint condition: ')
end)

-- ##
-- ## Go
-- ##

plugin.adapters.delve = {
    type = 'server',
    port = '${port}',
    executable = {
        command = 'dlv',
        args = { 'dap', '-l', '127.0.0.1:${port}' },
    },
}

plugin.configurations.go = {
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
