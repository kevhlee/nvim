local keymap = vim.keymap

-- ##
-- ## Buffers
-- ##

keymap.set('n', '<leader>b,', '<cmd>:bprev<cr>')
keymap.set('n', '<leader>b.', '<cmd>:bnext<cr>')
keymap.set('n', '<leader>bxx', '<cmd>:bdelete<cr>')

-- ##
-- ## Tabs
-- ##

keymap.set('n', '<leader>t,', '<cmd>:tabprev<cr>')
keymap.set('n', '<leader>t.', '<cmd>:tabnext<cr>')
keymap.set('n', '<leader>txx', '<cmd>:tabclose<cr>')

-- ##
-- ## Custom
-- ##

local M = {}

M.setup = function(config)
    if config.keymaps == nil then
        return
    end

    for _, value in pairs(config.keymaps) do
        local opts = {}
        if #value < 3 then
            print('Invalid key mapping:', value)
        elseif #value >= 4 then
            opts = value[4]
        end

        keymap.set(value[1], value[2], value[3], opts)
    end
end

return M
