local lualine = require 'lualine'

-- Color table for highlights
local colors = {
    bg = 'DEFAULT',
    fg = '#EEEEEE',
    yellow = '#F7CA88',
    cyan = '#008080',
    darkblue = '#081633',
    green = '#98BE65',
    orange = '#FF8800',
    violet = '#A9A1E1',
    magenta = '#C678DD',
    blue = '#51AFEF',
    red = '#EC5F67'
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end
}

-- Config
local config = {
    options = {
        -- Disable sections and component separators
        component_separators = "",
        section_separators = "",
        theme = {
            -- We are going to use lualine_c an lualine_x as left and
            -- right section. Both are highlighted by c theme .  So we
            -- are just setting default looks o statusline
            normal = {
                c = {
                    fg = colors.fg,
                    bg = colors.bg
                }
            },
            inactive = {
                c = {
                    fg = colors.fg,
                    bg = colors.bg
                }
            }
        }
    },
    sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {}
    },
    inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_v = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {}
    }
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

ins_left {
    function()
        return ''
    end,
    color = {
        fg = colors.yellow
    }, -- Sets highlighting of component
    left_padding = 0 -- We don't need space before this
}

ins_left {
    -- mode component
    function()
        -- auto change color according to neovims mode
        local mode_color = {
            n = colors.fg,
            i = colors.green,
            v = colors.blue,
            [''] = colors.blue,
            V = colors.blue,
            c = colors.magenta,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [''] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ['r?'] = colors.cyan,
            ['!'] = colors.red,
            t = colors.red
        }
        vim.api.nvim_command('hi! LualineMode guifg=' .. mode_color[vim.fn.mode()] .. " guibg=" .. colors.bg)
        return ''
    end,
    color = "LualineMode",
    left_padding = 0
}

ins_left {
    -- filesize component
    function()
        local function format_file_size(file)
            local size = vim.fn.getfsize(file)
            if size <= 0 then
                return ''
            end
            local sufixes = {'b', 'k', 'm', 'g'}
            local i = 1
            while size > 1024 do
                size = size / 1024
                i = i + 1
            end
            return string.format('%.1f%s', size, sufixes[i])
        end
        local file = vim.fn.expand('%:p')
        if string.len(file) == 0 then
            return ''
        end
        return format_file_size(file)
    end,
    condition = conditions.buffer_not_empty,
    color = {
        fg = colors.fg
    }
}

ins_left {
    'filename',
    condition = conditions.buffer_not_empty,
    color = {
        fg = colors.yellow,
        gui = 'bold'
    }
}

ins_left {'location'}

ins_left {
    'progress',
    color = {
        fg = colors.fg,
        gui = 'bold'
    }
}

ins_left {
    'diagnostics',
    sources = {'nvim_diagnostic'},
    symbols = {
        error = ' ',
        warn = ' ',
        info = ' ',
        hint = ' '
    },
    color_error = colors.red,
    color_warn = colors.yellow,
    color_info = colors.cyan
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {function()
    return '%='
end}

ins_right {
    function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_clients()
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = ' LSP:',
    color = {
        fg = colors.white,
        gui = 'bold'
    }
}

-- Add components to right sections
ins_right {
    'o:encoding', -- option component same as &encoding in viml
    upper = true, -- I'm not sure why it's upper case either ;)
    condition = conditions.hide_in_width,
    color = {
        fg = colors.white,
        gui = 'bold'
    }
}

ins_right {
    'branch',
    icon = '',
    condition = conditions.check_git_workspace,
    color = {
        fg = colors.violet,
        gui = 'bold'
    }
}

ins_right {
    'diff',
    -- Is it me or the symbol for modified us really weird
    symbols = {
        added = ' ',
        modified = '柳 ',
        removed = ' '
    },
    color_added = colors.green,
    color_modified = colors.orange,
    color_removed = colors.red,
    condition = conditions.hide_in_width
}

ins_right {
    function()
        return ''
    end,
    color = {
        fg = colors.yellow
    },
    right_padding = 1
}

lualine.setup(config)
