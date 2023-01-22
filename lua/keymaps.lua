local keymap = vim.keymap

-- ##
-- ## Buffers
-- ##

keymap.set('n', '<leader>b,', '<cmd>:bprev<cr>')
keymap.set('n', '<leader>b.', '<cmd>:bnext<cr>')

-- ##
-- ## Tabs
-- ##

keymap.set('n', '<leader>t,', '<cmd>:tabprev<cr>')
keymap.set('n', '<leader>t.', '<cmd>:tabnext<cr>')
