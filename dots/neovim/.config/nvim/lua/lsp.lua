local api = vim.api
local keym = vim.keymap

require("mason").setup()
require("mason-lspconfig").setup()
require("lspconfig").bashls.setup {}
require("lspconfig").pylsp.setup {
    settings = {
        formatCommand = {"black"},
        pylsp = {
            plugins = {
                black = { enabled = true },
                isort = { enabled = true },
                pylint = {
                    enabled = true,
                    args = {"--max-line-length=120"},
                },
                pyls_flake8 = {
                    enabled = false,
                    maxLineLength = 120,
                },
                pyls_mypy = { enabled = false },
            },
        },
    },
}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
-- Show diagnostics in a floating window
keym.set('n', 'ge', vim.diagnostic.open_float, opts)
keym.set('n', '[d', vim.diagnostic.goto_prev, opts)
keym.set('n', ']d', vim.diagnostic.goto_next, opts)
keym.set('n', 'gq', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    -- Displays hover information about the symbol under the cursor
    keym.set('n', 'K', vim.lsp.buf.hover, bufopts)
    -- Jump to the definition
    keym.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    -- Jump to the declaration
    keym.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    -- Lists all the implementations for the symbol under the cursor
    keym.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    -- Jumps to the definition of the type symbol
    keym.set('n', 'go', vim.lsp.buf.type_definition, bufopts)
    -- Lists all the references
    keym.set('n', 'gr', vim.lsp.buf.references, bufopts)
    -- Displays a function's signature information
    keym.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    -- Renames all references to the symbol under the cursor
    keym.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    -- Selects a code action available at the current cursor position
    keym.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    -- Format code at current cursor position
    keym.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- Fancy diagnostics signs on the line number column
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " } 
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end