local api = vim.api
local opt = vim.opt

-- 24-bit colors
opt.termguicolors = true

-- Color scheme
vim.cmd("colorscheme duskfox")

-- Render special whitespace characters
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Cmdline
opt.showmode = false

-- Statusline
require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'buffers'},
        lualine_x = {'encoding', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
