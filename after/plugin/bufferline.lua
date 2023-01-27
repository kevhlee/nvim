local ok_scope, scope = pcall(require, 'scope')
if ok_scope then
    scope.setup()
end

local ok_bufferline, bufferline = pcall(require, 'bufferline')
if not ok_bufferline then
    return
end

bufferline.setup {
    options = {
        mode = 'tabs', -- 'tabs', 'buffers'
        diagnostics = 'nvim_lsp', -- 'nvim_lsp', false
        numbers = 'ordinal',
        offsets = {
            {
                filetype = 'NvimTree',
                text = 'File Explorer',
                text_align = 'center',
                separator = true,
            },
        },
        hover = {
            enabled = false,
        },
        show_tab_indicators = true,
        always_show_bufferline = false,
    },
}

local keymap = vim.keymap

keymap.set('n', '<leader>bx,', '<cmd>BufferLineCloseLeft<cr>')
keymap.set('n', '<leader>bx.', '<cmd>BufferLineCloseRight<cr>')

keymap.set('n', '<leader>1', function()
    bufferline.go_to_buffer(1, true)
end)
keymap.set('n', '<leader>2', function()
    bufferline.go_to_buffer(2, true)
end)
keymap.set('n', '<leader>3', function()
    bufferline.go_to_buffer(3, true)
end)
keymap.set('n', '<leader>4', function()
    bufferline.go_to_buffer(4, true)
end)
keymap.set('n', '<leader>5', function()
    bufferline.go_to_buffer(5, true)
end)
keymap.set('n', '<leader>6', function()
    bufferline.go_to_buffer(6, true)
end)
keymap.set('n', '<leader>7', function()
    bufferline.go_to_buffer(7, true)
end)
keymap.set('n', '<leader>8', function()
    bufferline.go_to_buffer(8, true)
end)
keymap.set('n', '<leader>9', function()
    bufferline.go_to_buffer(9, true)
end)
