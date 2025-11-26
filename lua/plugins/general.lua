if nixCats("core.general") then
    return {
        {
            "guess-indent.nvim",
            for_cat = "core.general",
            event = "DeferredUIEnter",
            after = function()
                require("guess-indent").setup({
                    auto_cmd = true,
                    override_editorconfig = false,
                    filetype_exclude = {
                        "netrw",
                        "tutor",
                    },
                    buftype_exclude = {
                        "help",
                        "nofile",
                        "terminal",
                        "prompt",
                    },
                    on_tab_options = {
                        ["expandtab"] = false,
                    },
                    on_space_options = {
                        ["expandtab"] = true,
                        ["tabstop"] = "detected",
                        ["softtabstop"] = "detected",
                        ["shiftwidth"] = "detected",
                    },
                })
            end,
        },
        {
            "nvim-surround",
            for_cat = "core.general",
            event = { "BufReadPre", "BufNewFile" },
            after = function()
                require("nvim-surround").setup()
            end,
        },
        {
            "oil.nvim",
            keys = { { "<leader>o", "<CMD>Oil<CR>", desc = "Open oil" } },
            for_cat = "core.general",
            after = function()
                require("oil").setup({
                    default_file_explorer = true,
                    columns = { "icon", "permissions", "size" },
                    keymaps = {
                        ["-"] = "actions.parent",
                        ["<CR>"] = "actions.select",
                        ["<C-v>"] = "actions.select_vsplit",
                        ["<C-s>"] = "actions.select_split",
                    },
                })
            end,
        },
        {
            "undotree",
            for_cat = "core.general",
            cmd = { "UndotreeToggle", "UndotreeHide", "UndotreeShow", "UndotreeFocus", "UndotreePersistUndo" },
            keys = { { "<leader>U", "<cmd>UndotreeToggle<CR>", mode = { "n" }, desc = "Undo Tree" } },
            before = function(_)
                vim.g.undotree_WindowLayout = 1
                vim.g.undotree_SplitWidth = 40
                vim.g.undotree_WindowLayout = 3
            end,
        },
    }
end

return {}
