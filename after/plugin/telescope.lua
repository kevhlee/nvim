if not pcall(require, 'telescope') then
    return
end

require('telescope').setup {
    defaults = {
        color_devicons = true,
        file_ignore_patterns = {
            '.DS_Store',
            '.git/',
            'node_modules/',
        },
        layout_config = {
            horizontal = {
                prompt_position = 'top',
                preview_width = 0.55,
                results_width = 0.9,
            },
        },
        layout_strategy = 'horizontal',
        prompt_prefix = '🔭 ',
        sorting_strategy = 'ascending',
        winblend = 0,
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
            hijack_netrw = false,
            hidden = true,
            respect_gitignore = false,
        },
    },
}

require('telescope').load_extension 'fzf'
require('telescope').load_extension 'file_browser'
