local api = vim.api

-- Enable spell check on certain file formats
api.nvim_create_autocmd( "FileType", {
  pattern = { "gitcommit", "markdown", "rst", "text" },
  command = "setlocal spell",
  group = spellcheck,
})
