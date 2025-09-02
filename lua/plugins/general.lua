if nixCats("core.general") then
    return {
        {
            "vim-sleuth",
            for_cat = "general",
            event = "DeferredUIEnter",
        },
        {
            "mini.pick",
            for_cat = "general",
            keys = {
                {
                    "<leader>ff",
                    function()
                        MiniPick.builtin.files()
                    end,
                    desc = "finde files",
                },
                {
                    "<leader>fb",
                    function()
                        MiniPick.builtin.buffers()
                    end,
                    desc = "Find open buffers",
                },
                {
                    "<leader>fh",
                    function()
                        MiniPick.builtin.help()
                    end,
                    desc = "Find help",
                },
                {
                    "<leader>/",
                    function()
                        MiniPick.builtin.grep_live()
                    end,
                    desc = "Live grep",
                },
                {
                    "<leader>fd",
                    function()
                        MiniExtra.pickers.diagnostic()
                    end,
                    desc = "Diagnostics",
                },
                {
                    "<leader>fgb",
                    function()
                        MiniExtra.pickers.git_branches()
                    end,
                    desc = "Git branches",
                },
                {
                    "<leader>fc",
                    function()
                        MiniExtra.pickers.git_commits()
                    end,
                    desc = "Git commits",
                },
                {
                    "<leader>fr",
                    function()
                        MiniExtra.pickers.lsp({ scope = "references" })
                    end,
                    desc = "LSP references",
                },
                {
                    "<leader>ds",
                    function()
                        MiniExtra.pickers.lsp({ scope = "document_symbol" })
                    end,
                    desc = "Document symbols",
                },
                {
                    "<leader>ws",
                    function()
                        MiniExtra.pickers.lsp({ scope = "workspace_symbol" })
                    end,
                    desc = "Workspace symbols",
                },
                {
                    "gd",
                    function()
                        MiniExtra.pickers.lsp({ scope = "definition" })
                    end,
                    desc = "Goto definition",
                },
                {
                    "gtd",
                    function()
                        MiniExtra.pickers.lsp({ scope = "type_definition" })
                    end,
                    desc = "Goto type definition",
                },
                {
                    "gD",
                    function()
                        MiniExtra.pickers.lsp({ scope = "declaration" })
                    end,
                    desc = "Goto declaration",
                },
                {
                    "gr",
                    function()
                        MiniExtra.pickers.lsp({ scope = "references" })
                    end,
                    desc = "Goto references",
                },
                {
                    "gI",
                    function()
                        MiniExtra.pickers.lsp({ scope = "implementation" })
                    end,
                    desc = "Goto implementation",
                },
            },

            after = function()
                require("mini.pick").setup()
            end,
        },

        {
            "mini.extra",
            for_cat = "general",
            event = "DeferredUIEnter",
            after = function()
                require("mini.extra").setup()
            end,
        },
        {
            "mini.surround",
            for_cat = "general",
            event = "DeferredUIEnter",
            after = function()
                require("mini.surround").setup()
            end,
        },
        {
            "oil.nvim",
            keys = { { "<leader>e", "<CMD>Oil<CR>", desc = "Open oil" } },
            for_cat = "general",
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
            for_cat = "general",
            cmd = { "UndotreeToggle", "UndotreeHide", "UndotreeShow", "UndotreeFocus", "UndotreePersistUndo" },
            keys = { { "<leader>U", "<cmd>UndotreeToggle<CR>", mode = { "n" }, desc = "Undo Tree" } },
            before = function(_)
                vim.g.undotree_WindowLayout = 1
                vim.g.undotree_SplitWidth = 40
            end,
        },
    }
end

return {}
