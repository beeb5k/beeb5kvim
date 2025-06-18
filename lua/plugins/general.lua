return {
    {
        "nvim-treesitter",
        event = { "BufReadPost" },
        dep_of = { "otter.nvim", "render-markdown" },
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
                        enable = true,
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
        -- event = { "BufReadPre" },
        for_cat = "general.core",
        after = function()
            require("oil").setup({
                default_file_explorer = true,
                columns = { "git", "icon", "permissions", "size" },
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
        "nvim-ufo",
        event = { "DeferredUIEnter" },
        for_cat = "general.core",
        -- load = function(name)
        --     require("lzextras").loaders.multi({ name, "promise-async" })
        -- end,

        after = function()
            require("ufo").setup({
                provider_selector = function(bufnr, filetype, buftype)
                    return { "treesitter", "indent" }
                end,
            })
        end,
    },
    {
        "otter.nvim",
        for_cat = "otter",
        -- event = { "DeferredUIEnter" },
        on_require = { "otter" },
        -- ft = { "markdown", "norg", "templ", "nix", "javascript", "html", "typescript", },
        after = function(_)
            local otter = require("otter")
            otter.setup({
                lsp = {
                    -- `:h events` that cause the diagnostics to update. Set to:
                    -- { "BufWritePost", "InsertLeave", "TextChanged" } for less performant
                    -- but more instant diagnostic updates
                    diagnostic_update_events = { "BufWritePost" },
                    -- function to find the root dir where the otter-ls is started
                    root_dir = function(_, bufnr)
                        return vim.fs.root(bufnr or 0, {
                            ".git",
                            "_quarto.yml",
                            "package.json",
                        }) or vim.fn.getcwd(0)
                    end,
                },
                buffers = {
                    -- if set to true, the filetype of the otterbuffers will be set.
                    -- otherwise only the autocommand of lspconfig that attaches
                    -- the language server will be executed without setting the filetype
                    -- write <path>.otter.<embedded language extension> files
                    -- to disk on save of main buffer.
                    -- usefule for some linters that require actual files
                    -- otter files are deleted on quit or main buffer close
                    write_to_disk = false,
                },
                verbose = { -- set to false to disable all verbose messages
                    no_code_found = false, -- warn if otter.activate is called, but no injected code was found
                },
                strip_wrapping_quote_characters = { "'", '"', "`" },
                -- otter may not work the way you expect when entire code blocks are indented (eg. in Org files)
                -- When true, otter handles these cases fully.
                handle_leading_whitespace = false,
            })
        end,
    },
}
