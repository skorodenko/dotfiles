-- Set relative numbering when in normal mode
vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
    callback = function()
        vim.opt.relativenumber = true
    end,
})

-- Set absolute numbering when in insert mode
vim.api.nvim_create_autocmd({ "BufLeave", "InsertEnter" }, {
    callback = function()
        vim.opt.relativenumber = false
    end,
})
