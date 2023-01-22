local ok, plugin = pcall(require, 'telescope')
if not ok then
    return
end

plugin.setup {
    defaults = {
        color_devicons = true,
        winblend = 0,
        prompt_prefix = '🔭 ',
        sorting_strategy = 'ascending',
        selection_strategy = 'reset',
        layout_strategy = 'horizontal',
        layout_config = {
            horizontal = {
                prompt_position = 'top',
                preview_width = 0.55,
                results_width = 0.9,
            },
            vertical = {
                prompt_position = 'top',
                mirror = true,
            },
        },
        file_ignore_patterns = {
            '.DS_Store',
            '^.git/',
            '^node_modules/',
        },
    },
    pickers = {
        find_files = {
            hidden = true,
        },
        live_grep = {
            hidden = true,
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
        },
        file_browser = {
            hijack_netrw = true,
            hidden = true,
            respect_gitignore = false,
        },
    },
}

-- ##
-- ## Extensions
-- ##

plugin.load_extension 'fzf'
plugin.load_extension 'file_browser'

-- ##
-- ## Keymaps
-- ##

local keymap = vim.keymap

keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
keymap.set('n', '<leader>fj', '<cmd>Telescope jumplist<cr>')
keymap.set('n', '<leader>fm', '<cmd>Telescope marks<cr>')
keymap.set('n', '<leader>fk', '<cmd>Telescope keymaps<cr>')
keymap.set('n', '<leader>fr', '<cmd>Telescope registers<cr>')
keymap.set('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>')
keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
keymap.set('n', '<leader>f/', '<cmd>Telescope file_browser<cr>')

keymap.set('n', '<leader>ggc', '<cmd>Telescope git_commits<cr>')
keymap.set('n', '<leader>ggb', '<cmd>Telescope git_branch<cr>')
keymap.set('n', '<leader>ggs', '<cmd>Telescope git_status<cr>')
keymap.set('n', '<leader>ggt', '<cmd>Telescope git_stash<cr>')
