local opt = vim.opt

-- Show absolute line number in cursor and relative numbers around it
opt.number = true
opt.relativenumber = true

-- Indent and tab with 4 spaces
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 0
opt.expandtab = true

-- Mappings
vim.g.mapleader = "`"

-- Filetypes
require("filetype").setup {
    overrides = {
        extensions = {
            -- Set the filetype of *.eb files to Python
            eb = "python",
        },
    },
}

-- git
require('gitsigns').setup()
