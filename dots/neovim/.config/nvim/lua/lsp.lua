local api = vim.api
local diag = vim.diagnostic
local lsp = vim.lsp
local keym = vim.keymap

-- Mappings
local opts = { noremap=true, silent=true }
keym.set('n', '<leader>L', ':LspStart', opts)
keym.set('n', '<leader>l', ':LspStop', opts)

-- Mappings after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    -- Displays hover information about the symbol under the cursor
    keym.set('n', 'K', lsp.buf.hover, bufopts)
    -- Jump to the definition
    keym.set('n', 'gd', lsp.buf.definition, bufopts)
    -- Jump to the declaration
    keym.set('n', 'gD', lsp.buf.declaration, bufopts)
    -- Lists all the implementations for the symbol under the cursor
    keym.set('n', 'gi', lsp.buf.implementation, bufopts)
    -- Jumps to the definition of the type symbol
    keym.set('n', 'go', lsp.buf.type_definition, bufopts)
    -- Lists all the references
    keym.set('n', 'gr', lsp.buf.references, bufopts)
    -- Displays a function's signature information
    keym.set('n', '<leader>k', lsp.buf.signature_help, bufopts)
    -- Renames all references to the symbol under the cursor
    keym.set('n', '<leader>r', lsp.buf.rename, bufopts)
    -- Selects a code action available at the current cursor position
    keym.set('n', '<leader>a', lsp.buf.code_action, bufopts)
    -- Format code at current cursor position
    keym.set('n', '<leader>f', function() lsp.buf.format { async = true } end, bufopts)
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    keym.set('n', '<leader>e', diag.open_float, bufopts)
    keym.set('n', '<leader>q', diag.setloclist, bufopts)
    keym.set('n', '[d', diag.goto_prev, bufopts)
    keym.set('n', ']d', diag.goto_next, bufopts)
end

-- Fancy diagnostics signs on the line number column
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " } 
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end

-- Language server setup
require("mason").setup()
require("mason-lspconfig").setup()
require("lspconfig").bashls.setup {
    on_attach = on_attach,
}
require("lspconfig").pylsp.setup {
    on_attach = on_attach,
    settings = {
        pylsp = {
            plugins = {
                black = {
                    enabled = true,
                    line_length = 120,
                },
                isort = { enabled = false },
                pycodestyle = { enabled = false },
                pylint = {
                    enabled = true,
                    args = {
                        "--max-line-length=120",
                        "--disable=E0401",
                    },
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
