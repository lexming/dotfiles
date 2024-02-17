vim.filetype.add({
    extension = {
        eb = "python",
    },
    filename = {
        [".git/config"] = "gitconfig",
        ["README$"] = function(path, bufnr)
            if string.find("#", vim.api.nvim_buf_get_lines(bufnr, 0, 1, true)) then
                return "markdown"
            end
        end,
    },
})
