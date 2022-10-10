local api = vim.api
local opt = vim.opt

-- 24-bit colors
opt.termguicolors = true

-- Color scheme
vim.cmd("colorscheme nightfox")

-- Indent indicator
require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = false,
    show_current_context_start = false,
}
