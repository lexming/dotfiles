local api = vim.api
local diag = vim.diagnostic
local lsp = vim.lsp
local keym = vim.keymap

-- Global LSP Mappings
local opts = { noremap = true, silent = true }
keym.set('n', '<leader>L', ':LspStart', opts)
keym.set('n', '<leader>l', ':LspStop', opts)

--  This function gets run when an LSP attaches to a particular buffer.
api.nvim_create_autocmd('LspAttach', {
    group = api.nvim_create_augroup('maps-lsp-attach', { clear = true }),
    callback = function(event)
        -- Helper function to more easily define mappings specific for LSP related items.
        -- It sets the mode, buffer and description for us each time.
        local map = function(keys, func, desc)
            keym.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        --  To jump back, press <C-t>.
        map('gd', lsp.buf.definition, '[G]oto [D]efinition')

        -- Find references for the word under your cursor.
        map('gr', lsp.buf.references, '[G]oto [R]eferences')

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        map('gI', lsp.buf.implementation, '[G]oto [I]mplementation')

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.
        map('gD', lsp.buf.declaration, '[G]oto [D]eclaration')

        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        map('<leader>D', lsp.buf.type_definition, 'Type [D]efinition')

        -- Rename the variable under your cursor.
        --  Most Language Servers support renaming across files, etc.
        map('<leader>rn', lsp.buf.rename, '[R]e[n]ame')

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map('<leader>ca', lsp.buf.code_action, '[C]ode [A]ction')

        -- Format code at current cursor position
        map('<leader>cf', function() lsp.buf.format { async = true } end, '[C]ode [F]ormat')

        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        map('<leader>e', diag.open_float, 'Diagnostics Float')
        map('<leader>q', diag.setloclist, 'Diagnostics List')
        map('[d', diag.goto_prev, 'Previous Diagnostic')
        map(']d', diag.goto_next, 'Next Diagnostic')

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = lsp.get_client_by_id(event.data.client_id)
        if client and client.supports_method(lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = api.nvim_create_augroup('cursor-lsp-highlight', { clear = false })
            api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = lsp.buf.document_highlight,
            })

            api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = lsp.buf.clear_references,
            })

            api.nvim_create_autocmd('LspDetach', {
                group = api.nvim_create_augroup('maps-lsp-detach', { clear = true }),
                callback = function(event2)
                    lsp.buf.clear_references()
                    api.nvim_clear_autocmds { group = 'cursor-lsp-highlight', buffer = event2.buf }
                end,
            })
        end
    end,
})

-- Fancy diagnostics signs on the line number column
local signs = { Error = "✖ ", Warn = "⚠ ", Hint = "☀︎ ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Language server setup
-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
require("mason").setup()
require("mason-lspconfig").setup()

--[[ Settings for Bash LSP ]]
require("lspconfig").bashls.setup({})

--[[ Settings for Lua LSP ]]
require("lspconfig").lua_ls.setup({})

--[[ Settings for Markdown LSP ]]
require("lspconfig").marksman.setup({})

--[[ Settings for Python LSP ]]
require('lspconfig').ruff.setup({
    init_options = {
        settings = {
            lineLength = 120,
            lint = {
                select = {
                    "F",    -- Pyflakes
                    "E",    -- pycodestyle - errors
                    "W",    -- pycodestyle - warnings
                    "I",    -- isort
                    "N",    -- pep8 naming
                    "UP",   -- pyupgrade
                    "B",    -- flake8 - bugbear
                    "A",    -- flake8 - builtins
                    "C4",   -- flake8 - comprehensions
                    "T20",  -- flake8 - prints
                    "SIM",  -- flake8 - simplify
                    "Q",    -- flake8 - quotes
                    "RET",  -- flake8 - returns
                    "ARG",  -- flake8 - unused args
                    "PL",   -- pylint
                },
                ignore = {
                    "PLR",  -- pylint - refactor
                },
            },
        }
    }
})
