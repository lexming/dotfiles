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
