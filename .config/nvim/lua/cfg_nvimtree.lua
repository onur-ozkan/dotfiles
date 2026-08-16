local nvim_api = require 'nvim-tree.api'
local multisearch = require 'cfg_multisearch'

local ignored_paths = vim.tbl_map(function(path)
    return '^' .. vim.pesc(path) .. '$'
end, multisearch.config.ignored_paths)

local function on_attach(bufnr)
    nvim_api.map.on_attach.default(bufnr)

    local opts = { buffer = bufnr, noremap = true, silent = true }

    vim.keymap.set('n', '<C-Right>', function()
        require('cfg_multisearch').switch_from_tree('Grep')
    end, opts)
    vim.keymap.set('n', '<C-Left>', function()
        require('cfg_multisearch').switch_from_tree('Commits')
    end, opts)
    vim.keymap.set('n', '<C-Down>', function()
        require('cfg_multisearch').focus_down_from_tree()
    end, opts)
    vim.keymap.set('n', '<C-Up>', function()
        require('cfg_multisearch').focus_up_from_tree()
    end, opts)
    vim.keymap.set('n', '<CR>', function()
        local node = nvim_api.tree.get_node_under_cursor()
        nvim_api.node.open.no_window_picker(node)
        if node and node.type == 'file' then
            vim.schedule(function()
                require('cfg_multisearch').close()
            end)
        end
    end, opts)
end

require'nvim-tree'.setup {
	on_attach = on_attach,
	auto_reload_on_write = true,
	disable_netrw = true,
	hijack_cursor = false,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = false,
	sort_by = "name",
	view = {
		width = 40,
		side = "right",
		preserve_window_proportions = false,
		number = true,
		relativenumber = true,
		signcolumn = "yes",
		float = {
			enable = false,
		},
	},
	hijack_directories = {
		enable = false,
		auto_open = false,
	},
	update_focused_file = {
		enable = true,
		ignore_list = {},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
		dotfiles = false,
		custom = ignored_paths,
		exclude = {},
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 400,
	},
	renderer = {
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "",
					staged = "",
					unmerged = "",
					renamed = "",
					deleted = "",
					untracked = "",
					ignored = "",
				},
				folder = {
					-- arrow_open = "",
					-- arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				}
			}
		}
	},
	actions = {
		change_dir = {
			enable = true,
			global = false,
		},
		open_file = {
			quit_on_open = true,
			resize_window = true,
			window_picker = {
				enable = false,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	log = {
		enable = false,
		truncate = false,
		types = {
			all = false,
			config = false,
			copy_paste = false,
			git = false,
			profile = false,
		},
	},
}
