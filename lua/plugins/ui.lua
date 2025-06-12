return {
    {
        "mini.icons",
        event = { "DeferredUIEnter" },
        for_cat = "general.ui",
        after = function()
            require("mini.icons").setup({})
        end,
    },
    {
        "lualine.nvim",
        event = { "DeferredUIEnter" },
        for_cat = "general.ui",
        load = function(name)
            require("lzextras").loaders.multi({ name, "lsp-progress" })
        end,

        after = function(_)
            require("lsp-progress").setup()
            require("lualine").setup({
                require("lualine").setup({
                    options = {
                        theme = {
                            normal = {
                                a = { fg = "NONE", bg = "NONE" },
                                b = { fg = "NONE", bg = "NONE" },
                                c = { fg = "NONE", bg = "NONE" },
                            },
                            insert = { a = { fg = "NONE", bg = "NONE" } },
                            visual = { a = { fg = "NONE", bg = "NONE" } },
                            replace = { a = { fg = "NONE", bg = "NONE" } },
                            command = { a = { fg = "NONE", bg = "NONE" } },
                            inactive = {
                                a = { fg = "NONE", bg = "NONE" },
                                b = { fg = "NONE", bg = "NONE" },
                                c = { fg = "NONE", bg = "NONE" },
                            },
                        },
                        section_separators = "",
                        component_separators = "",
                        icons_enabled = true, -- optional: to match default vim
                    },
                    sections = {
                        lualine_a = { "filename" },
                        lualine_b = { "branch" },
                        lualine_c = {
                            function()
                                return require("lsp-progress").progress()
                            end,
                        },
                        lualine_x = {
                            {
                                "diagnostics",
                                sources = { "nvim_diagnostic" },
                                sections = { "error", "warn", "info", "hint" },
                                symbols = { error = " ", warn = " ", info = "󰋼 ", hint = " " },
                                colored = false,
                                update_in_insert = false,
                            },
                        },
                        lualine_y = { "filetype", "progress" },
                        lualine_z = { "location" },
                    },
                }),
            })
            vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
            vim.api.nvim_create_autocmd("User", {
                group = "lualine_augroup",
                pattern = "LspProgressStatusUpdated",
                callback = require("lualine").refresh,
            })
        end,
    },
    {
        "indent-blankline.nvim",
        event = { "BufReadPost" },
        for_cat = "general.ui",
        after = function()
            require("ibl").setup({
                indent = { char = "│" },
                scope = { enabled = false },
            })
        end,
    },
}
