return {
    'lewis6991/gitsigns.nvim',
    config = function()
        local gitsigns = require 'gitsigns'

        gitsigns.setup {
            attach_to_untracked = true,
            max_file_length = 69420,
            update_debounce = 100,
            current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> <abbrev_sha> - <summary>',
            current_line_blame_opts = {
                virt_text_pos = 'eol',
                delay = 1000,
                ignore_whitespace = false,
            },
            watch_gitdir = {
                interval = 1000,
                follow_files = true,
            },
            preview_config = {
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
            },
        }

        vim.keymap.set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<cr>')
        vim.keymap.set('n', '<leader>hs', '<cmd>Gitsigns stage_hunk<cr>')
        vim.keymap.set('v', '<leader>hs', function()
            gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end)
        vim.keymap.set('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<cr>')
        vim.keymap.set('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<cr>')
        vim.keymap.set('v', '<leader>hr', function()
            gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end)
        vim.keymap.set('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<cr>')
        vim.keymap.set('n', '<leader>hd', function()
            gitsigns.diffthis(nil, { vertical = false })
        end)
        vim.keymap.set('n', '<leader>hD', function()
            gitsigns.diffthis('~', { vertical = false })
        end)
        vim.keymap.set('n', '<leader>hb', function()
            gitsigns.blame_line { full = true }
        end)
        vim.keymap.set('n', '<leader>hj', '<cmd>Gitsigns next_hunk<cr>')
        vim.keymap.set('n', '<leader>hk', '<cmd>Gitsigns prev_hunk<cr>')
        vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    end,
}
