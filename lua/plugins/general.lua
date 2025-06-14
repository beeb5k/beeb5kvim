return {
    {
        "nvim-treesitter",
        event = { "DeferredUIEnter" },
        for_cat = "general.core",
        load = function(name)
            require("lzextras").loaders.multi({ name, "nvim-treesitter-textobjects" })
        end,
        after = function(_)
            vim.defer_fn(function()
                require("nvim-treesitter.configs").setup({
                    -- auto_install = true,
                    -- parser_install_dir = absolute_path,

                    highlight = {
                        enable = true,
                        -- additional_vim_regex_highlighting = { "kotlin" },
                    },
                    indent = {
                        enable = false,
                    },
                    incremental_selection = {
                        enable = true,
                        keymaps = {
                            init_selection = "<M-t>",
                            node_incremental = "<M-t>",
                            scope_incremental = "<M-T>",
                            node_decremental = "<M-r>",
                        },
                    },
                    textobjects = {
                        select = {
                            enable = true,
                            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                            keymaps = {
                                -- You can use the capture groups defined in textobjects.scm
                                ["aa"] = "@parameter.outer",
                                ["ia"] = "@parameter.inner",
                                ["af"] = "@function.outer",
                                ["if"] = "@function.inner",
                                ["ac"] = "@class.outer",
                                ["ic"] = "@class.inner",
                            },
                        },
                        move = {
                            enable = true,
                            set_jumps = true, -- whether to set jumps in the jumplist
                            goto_next_start = {
                                ["]m"] = "@function.outer",
                                ["]]"] = "@class.outer",
                            },
                            goto_next_end = {
                                ["]M"] = "@function.outer",
                                ["]["] = "@class.outer",
                            },
                            goto_previous_start = {
                                ["[m"] = "@function.outer",
                                ["[["] = "@class.outer",
                            },
                            goto_previous_end = {
                                ["[M"] = "@function.outer",
                                ["[]"] = "@class.outer",
                            },
                        },
                        swap = {
                            enable = true,
                            swap_next = {
                                ["<leader>a"] = "@parameter.inner",
                            },
                            swap_previous = {
                                ["<leader>A"] = "@parameter.inner",
                            },
                        },
                    },
                })
            end, 0)
        end,
    },
    {
        "oil.nvim",
        keys = { { "<leader>o", "<CMD>Oil<CR>", desc = "Oil" } },
        -- event = { "DeferredUIEnter" },
        for_cat = "general.core",
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
        "neogit",
        keys = { { "<leader>ng", "<CMD>Neogit<CR>", desc = "Neogit" } },
        for_cat = "general.core",
        -- event = { "BufReadPost" },
        after = function()
            require("neogit").setup({})
        end,
    },
    {
        "nvim-ufo",
        event = { "DeferredUIEnter" },
        for_cat = "general.core",
        load = function(name)
            require("lzextras").loaders.multi({ name, "promise-async" })
        end,

        after = function()
            require("ufo").setup({
                provider_selector = function(bufnr, filetype, buftype)
                    return { "treesitter", "indent" }
                end,
            })
        end,
    },
}
