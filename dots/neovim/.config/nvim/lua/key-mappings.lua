local keym = vim.keymap

-- Clear highlights on search when pressing <Esc> in normal mode
keym.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Mappings for substitue.nvim
keym.set("n", "s", require('substitute').operator, { noremap = true })
keym.set("n", "ss", require('substitute').line, { noremap = true })
keym.set("n", "S", require('substitute').eol, { noremap = true })
keym.set("x", "s", require('substitute').visual, { noremap = true })

-- Mappings for leap.nvim
keym.set({'n', 'x', 'o'}, '<leader>s',  '<Plug>(leap-forward)')
keym.set({'n', 'x', 'o'}, '<leader>S',  '<Plug>(leap-backward)')
keym.set({'n', 'x', 'o'}, '<leader>sg', '<Plug>(leap-from-window)')

-- Mappings for osc52
keym.set('n', '<leader>c', require('osc52').copy_operator, {expr = true})
keym.set('n', '<leader>cc', '<leader>c_', {remap = true})
keym.set('v', '<leader>c', require('osc52').copy_visual)
