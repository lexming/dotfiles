local keym = vim.keymap

-- Clear highlights on search when pressing <Esc> in normal mode
keym.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Mappings for leap.nvim
keym.set({'n', 'x', 'o'}, '<leader>s',  '<Plug>(leap-forward)')
keym.set({'n', 'x', 'o'}, '<leader>S',  '<Plug>(leap-backward)')
keym.set({'n', 'x', 'o'}, '<leader>sg', '<Plug>(leap-from-window)')
