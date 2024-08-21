local opt = vim.opt
local keym = vim.keymap

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

-- Clear highlights on search when pressing <Esc> in normal mode
keym.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
