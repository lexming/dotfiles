vim.filetype.add({
    extension = {
        -- treat easybuild files as python files
        eb = "python",
    },
    filename = {
        -- use gitconfig for git configuration
        [".git/config"] = "gitconfig",
        -- detect README files written in markdown
        ["README$"] = function(path, bufnr)
            if string.find("#", vim.api.nvim_buf_get_lines(bufnr, 0, 1, true)) then
                return "markdown"
            end
        end,
    },
})
