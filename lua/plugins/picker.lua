local mini = function(key, action, desc)
    return {
        key,
        "<cmd>Pick " .. action .. "<CR>",
        mode = { "n" },
        desc = desc,
    }
end

local telescope_builtin = function(key, action, desc)
    return {
        key,
        "<cmd>Telescope " .. action .. "<CR>",
        mode = { "n" },
        desc = desc,
    }
end

return {
    {
        "mini.pick",
        for_cat = "core.picker.mini",
        event = "DeferredUIEnter",
        keys = {
            mini("<leader>ff", "files", "finde files"),
            mini("<leader>fb", "buffers", "Find open buffers"),
            mini("<leader>fh", "help", "Find help"),
            mini("<leader>/", "grep_live", "Live grep"),

            -- MiniExtra
            mini("<leader>fd", "diagnostic", "Diagnostics"),
            mini("<leader>fgb", "git_branches", "Git branches"),
            mini("<leader>fc", "git_commits", "Git commits"),

            -- LSP scopes
            mini("<leader>fr", "lsp scope='references'", "LSP references"),
            mini("<leader>ds", "lsp scope='document_symbol'", "Document symbols"),
            mini("<leader>ws", "lsp scope='workspace_symbol'", "Workspace symbols"),

            mini("ld", "lsp scope='definition'", "Goto definition"),
            mini("ltd", "lsp scope='type_definition'", "Goto type definition"),
            mini("lD", "lsp scope='declaration'", "Goto declaration"),
            mini("lr", "lsp scope='references'", "Goto references"),
            mini("lI", "lsp scope='implementation'", "Goto implementation"),
        },
        load = function(name)
            require("lzextras").loaders.multi({
                name,
                "mini.extra",
            })
        end,
        after = function()
            require("mini.pick").setup()
        end,
    },
    {
        "telescope.nvim",
        event = "DeferredUIEnter",
        for_cat = "core.picker.telescope",
        keys = {
            telescope_builtin("<leader>ff", "find_files", "Search files in cwd"),
            telescope_builtin("<leader>fb", "buffers", "Search files in cwd"),
            telescope_builtin("<leader>fo", "oldfiles", "Recent files"),
            telescope_builtin("<leader>fr", "registers", "Registers"),
            telescope_builtin("<leader>fj", "jumplist", "Jump list"),
            telescope_builtin("<leader>fm", "marks", "Marks"),

            telescope_builtin("<leader>fq", "quickfix", "Quickfix list"),
            telescope_builtin("<leader>fl", "loclist", "Location list"),

            telescope_builtin("<leader>st", "treesitter", "Treesitter symbols"),

            telescope_builtin("<leader>sc", "commands", "Commands"),
            telescope_builtin("<leader>sp", "spell_suggest", "Spell suggestions"),

            telescope_builtin("<leader>sg", "live_grep", "Search by grep"),
            telescope_builtin("<leader>ss", "grep_string", "Search string"),
            telescope_builtin("<leader>sk", "keymaps", "Search keymaps"),
            telescope_builtin("<leader>sh", "help_tags", "Search help tags"),
            telescope_builtin("<leader>/", "current_buffer_fuzzy_find", "Search in current buffer"),

            telescope_builtin("<leader>gc", "git_commits", "Git commits"),
            telescope_builtin("<leader>gB", "git_branches", "Git branches"),
            telescope_builtin("<leader>gs", "git_status", "Git status"),
            telescope_builtin("<leader>gS", "git_stash", "Git stash"),

            telescope_builtin("<leader>ls", "lsp_document_symbols", "Document symbols"),
            telescope_builtin("<leader>lS", "lsp_workspace_symbols", "Workspace symbols"),
            telescope_builtin("<leader>lds", "lsp_dynamic_workspace_symbols", "Workspace symbols"),
            telescope_builtin("<leader>ld", "diagnostics", "Diagnostics"),
            telescope_builtin("<leader>lD", "lsp_definitions", "LSP definitions"),
            telescope_builtin("<leader>li", "lsp_incoming_calls", "LSP incoming calls"),
            telescope_builtin("<leader>lo", "lsp_outgoing_calls", "LSP outgoing calls"),
            telescope_builtin("<leader>lt", "lsp_type_definitions", "LSP type definitions"),
            telescope_builtin("grr", "lsp_references", "LSP references"),
            telescope_builtin("gri", "lsp_implementations", "LSP implementations"),
        },
        load = function(name)
            require("lzextras").loaders.multi({
                name,
                "telescope-fzf-native.nvim",
                "telescope-ui-select.nvim",
            })
        end,
        after = function()
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<M-Enter>"] = "to_fuzzy_refine",
                        },
                    },
                },
                pickers = {
                    buffers = {
                        mappings = {
                            i = {
                                -- ["<C-d>"] = "delete_buffer",
                            },
                            n = {
                                ["d"] = "delete_buffer",
                            },
                        },
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("fzf")
            require("telescope").load_extension("ui-select")
        end,
    },
}
