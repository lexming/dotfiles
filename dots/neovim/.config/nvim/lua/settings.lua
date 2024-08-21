local opt = vim.opt

-- Show absolute line number in cursor and relative numbers around it
opt.number = true
opt.relativenumber = true

-- Indent and tab with 4 spaces
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 0
opt.expandtab = true

-- Keep undo history
vim.opt.undofile = true

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
