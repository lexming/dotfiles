local api = vim.api
local opt = vim.opt

-- 24-bit colors
opt.termguicolors = true

-- Color scheme
vim.cmd("colorscheme duskfox")

-- Indent indicator
require("ibl").setup()

-- Tree-Sitter
require("nvim-treesitter.configs").setup {
    -- A list of parser names, or "all"
    ensure_installed = {
        -- generic
        "c", "cpp", "fortran", "rust",
        -- scripting
        "bash", "lua", "java", "perl", "python", "r", "ruby",
        -- build tools
        "cmake", "make",
        -- web development
        "css", "html", "php", "javascript", 
        -- documentation
        "markdown", "rst",
        -- misc
        "dockerfile", "json", "regex", "sql", "toml", "yaml",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
}

-- Statusline
require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'buffers'},
        lualine_x = {'encoding', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

-- Cmdline
opt.showmode = false
