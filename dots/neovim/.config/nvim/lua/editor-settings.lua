local opt = vim.opt
local sch = vim.schedule

-- Show absolute line number in cursor and relative numbers around it
opt.number = true
opt.relativenumber = true

-- Indent and tab with 4 spaces
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 0
opt.expandtab = true

-- Keep undo history
opt.undofile = true

-- Keep a buffer of eight lines on scrolling
opt.scrolloff = 8

-- Sync clipboard between OS and Neovim.
-- see `:help 'clipboard'`
sch(function()
    opt.clipboard = 'unnamedplus'
end)
