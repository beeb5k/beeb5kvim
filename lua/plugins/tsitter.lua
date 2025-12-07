if nixCats("tsitter") then
    return {
        {
            "nvim-treesitter",
            for_cat = "tsitter",
            event = "DeferredUIEnter",
            load = function(name)
                require("lzextras").loaders.multi({
                    name,
                    "nvim-treesitter-textobjects",
                })
            end,
            after = function(_)
                vim.defer_fn(function()
                    require("nvim-treesitter.configs").setup({
                        highlight = {
                            enable = true,
                        },
                        indent = { enable = false },
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
                                disable = { "fennel" },
                                lookahead = true,
                                keymaps = {
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
                                disable = { "fennel" },
                                set_jumps = true,
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
    }
end

return {}
