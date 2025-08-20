return {
    {
        "nvim-web-devicons",
        event = { "DeferredUIEnter" },
        for_cat = "general.ui",
        after = function()
            require("nvim-web-devicons").setup({})
        end,
    },
    {
        "lualine.nvim",
        event = { "DeferredUIEnter" },
        for_cat = "general.ui",
        after = function(_)
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
                    lualine_a = {
                        "filename",
                    },
                    lualine_b = { "branch" },
                    lualine_c = {},
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
            })
        end,
    },
    {
        "eyeliner.nvim",
        event = { "DeferredUIEnter" },
        for_cat = "general.ui",
        after = function()
            require("eyeliner").setup({
                highlight_on_key = true,
                dim = true,
                disabled_filetype = { "NeogitStatus", "help" },
                disabled_buftypes = { "nofile" },
            })
        end,
    },
    {
        "hlchunk.nvim",
        event = { "BufReadPre", "BufNewFile" },
        for_cat = "general.ui",
        after = function()
            require("hlchunk").setup({
                chunk = {
                    enable = true,
                    chars = {
                        horizontal_line = "─",
                        vertical_line = "│",
                        left_top = "╭",
                        left_bottom = "╰",
                        right_arrow = "─",
                    },
                },
                indent = {
                    enable = true,
                    chars = {
                        "│",
                    },
                    style = {
                        vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
                    },
                },
            })
        end,
    },
}
