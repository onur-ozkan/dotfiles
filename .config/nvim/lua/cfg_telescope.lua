local telescope = require 'telescope'

-- Standalone Telescope picker defaults.
telescope.setup {
    defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
            horizontal = {
                preview_width = 0.68,
            },
        },
    },
    pickers = {
        git_status = {
            layout_strategy = 'vertical',
            layout_config = {
                width = 0.88,
                height = 0.9,
                vertical = {
                    mirror = true,
                    prompt_position = 'top',
                    preview_height = 0.68,
                },
            },
            prompt_title = 'Status',
            results_title = false,
            preview_title = 'Diff',
        },
    },
}
