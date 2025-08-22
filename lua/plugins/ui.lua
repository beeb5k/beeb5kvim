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
        "tiny-inline-diagnostic.nvim",
        event = { "DeferredUIEnter" },
        for_cat = "general.ui",
        after = function()
            require("tiny-inline-diagnostic").setup({
                preset = "modern",
            })
        end,
    },
    {
        "lualine.nvim",
        event = { "DeferredUIEnter" },
        for_cat = "general.ui",
        after = function(_)
            require("lualine").setup({
                options = {
                    icons_enabled = true,
                    component_separators = { left = "|", right = "|" },
                    section_separators = { left = "", right = "" },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 500,
                        tabline = 500,
                        winbar = 500,
                    },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = {
                        "branch",
                        {
                            "diff",
                            symbols = {
                                added = " ",
                                modified = " ",
                                removed = " ",
                            },
                        },
                        "diagnostics",
                    },
                    lualine_c = {
                        {
                            "filename",
                            path = 1,
                            status = true,
                        },
                    },
                    lualine_x = {
                        -- components.python_env,
                        "encoding",
                        "fileformat",
                        "filetype",
                    },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {
                        {
                            "filename",
                            path = 3,
                            status = true,
                        },
                    },
                    lualine_c = {},
                    lualine_x = { "filetype" },
                    lualine_y = {},
                    lualine_z = {},
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
                    error_sign = false,
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
