vim.api.nvim_create_autocmd("FileType", {
    pattern = "gitcommit",
    callback = function()
        vim.opt_local.spell = false
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "NeogitStatus",
    callback = function()
        vim.b.eyeliner_disable = true
    end,
})
