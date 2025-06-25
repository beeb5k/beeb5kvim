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
        after = function(_)
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
                        lualine_a = {
                            {
                                require("noice").api.statusline.mode.get,
                                cond = require("noice").api.statusline.mode.has,
                                color = { fg = "#ff9e64" },
                            },
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
                }),
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
            })
        end,
    },
    {
        "dropbar.nvim",
        event = { "DeferredUIEnter" },
        for_cat = "general.ui",
        after = function(_)
            require("dropbar").setup({})
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
    {
        "noice.nvim",
        event = { "DeferredUIEnter" },
        dep_of = { "lualine.nvim" },
        after = function()
            require("noice").setup({
                lsp = {
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                    },
                },
                presets = {
                    bottom_search = false, -- use a classic bottom cmdline for search
                    command_palette = false, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false, -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = true, -- add a border to hover docs and signature help
                },
            })
        end,
    },
    {
        "nvim-notify",
        event = { "DeferredUIEnter" },
        after = function()
            vim.notify = require("notify")
        end,
    },
}
