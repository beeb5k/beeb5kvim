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

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    callback = function()
        if vim.bo.filetype == "rust" then
            vim.cmd("write")
        end
    end,
    desc = "Auto-save Rust files because rust-analyzer sucks",
})
