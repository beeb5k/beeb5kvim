return {
    {
        "nvim-treesitter",
        event = { "BufReadPost" },
        -- dep_of = { "otter.nvim", "render-markdown" },
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
        load = function(name)
            require("lzextras").loaders.multi({ name, "promise-async" })
        end,

        after = function()
            require("ufo").setup({
                provider_selector = function(bufnr, filetype, buftype)
                    return { "treesitter", "indent" }
                end,
            })

            vim.keymap.set("n", "zR", require("ufo").openAllFolds)
            vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
        end,
    },
    {
        "flash.nvim",
        event = { "DeferredUIEnter" },
        for_cat = "general.core",
        keys = {
            {
                "<leader>s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash",
            },
            {
                "<leader>S",
                mode = { "n", "x", "o" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter",
            },
            {
                "<leader>r",
                mode = "o",
                function()
                    require("flash").remote()
                end,
                desc = "Remote Flash",
            },
            {
                "<leader>R",
                mode = { "o", "x" },
                function()
                    require("flash").treesitter_search()
                end,
                desc = "Treesitter Search",
            },
            {
                "<c-s>",
                -- mode = { "c" },
                function()
                    require("flash").toggle()
                end,
                desc = "Toggle Flash Search",
            },
        },
    },
    -- {
    --     "otter.nvim",
    --     for_cat = "otter",
    --     -- event = { "DeferredUIEnter" },
    --     on_require = { "otter" },
    --     -- ft = { "markdown", "norg", "templ", "nix", "javascript", "html", "typescript", },
    --     after = function(_)
    --         local otter = require("otter")
    --         otter.setup({
    --             lsp = {
    --                 -- `:h events` that cause the diagnostics to update. Set to:
    --                 -- { "BufWritePost", "InsertLeave", "TextChanged" } for less performant
    --                 -- but more instant diagnostic updates
    --                 diagnostic_update_events = { "BufWritePost" },
    --                 -- function to find the root dir where the otter-ls is started
    --                 root_dir = function(_, bufnr)
    --                     return vim.fs.root(bufnr or 0, {
    --                         ".git",
    --                         "_quarto.yml",
    --                         "package.json",
    --                     }) or vim.fn.getcwd(0)
    --                 end,
    --             },
    --             buffers = {
    --                 -- if set to true, the filetype of the otterbuffers will be set.
    --                 -- otherwise only the autocommand of lspconfig that attaches
    --                 -- the language server will be executed without setting the filetype
    --                 -- write <path>.otter.<embedded language extension> files
    --                 -- to disk on save of main buffer.
    --                 -- usefule for some linters that require actual files
    --                 -- otter files are deleted on quit or main buffer close
    --                 write_to_disk = false,
    --             },
    --             verbose = { -- set to false to disable all verbose messages
    --                 no_code_found = false, -- warn if otter.activate is called, but no injected code was found
    --             },
    --             strip_wrapping_quote_characters = { "'", '"', "`" },
    --             -- otter may not work the way you expect when entire code blocks are indented (eg. in Org files)
    --             -- When true, otter handles these cases fully.
    --             handle_leading_whitespace = false,
    --         })
    --     end,
    -- },
    -- {
    --     "fzf-lua",
    --     event = { "DeferredUIEnter" },
    --     for_cat = "general.core",
    --     after = function()
    --         local fzf = require("fzf-lua")
    --         fzf.setup({
    --             "border-fused",
    --             -- fzf_bin = "sk",
    --             -- winopts = { preview = { default = "bat" } },
    --             -- manpages = { previewer = "man_native" },
    --             -- helptags = { previewer = "help_native" },
    --             -- lsp = { code_actions = { previewer = "codeaction_native" } },
    --             -- tags = { previewer = "bat" },
    --             -- btags = { previewer = "bat" },
    --             buffers = {
    --                 previewer = false,
    --                 winopts = {
    --                     width = 0.5, -- cap buffer picker window to 50% of screen
    --                 },
    --             },
    --             defaults = {
    --                 no_header = true, -- removes the hint/footer globally
    --                 fzf_opts = {
    --                     ["--no-info"] = "", -- optionally remove the status/info bar
    --                 },
    --             },
    --         })
    --
    --         fzf.register_ui_select()
    --
    --         -- 🔹 Global keymaps (normal mode)
    --         vim.keymap.set("n", "<leader><space>", function()
    --             local is_git = vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null"):match("true")
    --             if is_git then
    --                 fzf.git_files()
    --             else
    --                 fzf.files()
    --             end
    --         end, { desc = "Smart Find Files" })
    --
    --         -- File
    --         vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find Files" })
    --         vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Buffers" })
    --         vim.keymap.set("n", "<leader>fr", fzf.oldfiles, { desc = "Recent Files" })
    --
    --         -- Grep
    --         vim.keymap.set("n", "<leader>/", fzf.live_grep, { desc = "Live Grep" })
    --         vim.keymap.set("n", "<leader>sb", fzf.lines, { desc = "Grep buffer lines" })
    --         vim.keymap.set("n", "<leader>sB", fzf.grep_curbuf, { desc = "Grep buffer" })
    --         vim.keymap.set("n", "<leader>sw", fzf.grep_cword, { desc = "Grep Current word" })
    --
    --         -- search
    --         vim.keymap.set("n", '<leader>s"', fzf.registers, { desc = "Search registers" })
    --         vim.keymap.set("n", "<leader>s/", fzf.search_history, { desc = "Search search history" })
    --         vim.keymap.set("n", "<leader>sa", fzf.autocmds, { desc = "Search autocmds" })
    --         vim.keymap.set("n", "<leader>sc", fzf.command_history, { desc = "Search command history" })
    --         vim.keymap.set("n", "<leader>sC", fzf.commands, { desc = "Search commands" })
    --         vim.keymap.set("n", "<leader>sd", fzf.diagnostics_workspace, { desc = "Search diagnostic" })
    --         vim.keymap.set("n", "<leader>sD", fzf.diagnostics_document, { desc = "Search buffer diagnostic" })
    --         vim.keymap.set("n", "<leader>sh", fzf.helptags, { desc = "Search help" })
    --         vim.keymap.set("n", "<leader>sj", fzf.jumps, { desc = "Search jumps" })
    --         vim.keymap.set("n", "<leader>sk", fzf.keymaps, { desc = "Search Keymaps" })
    --         vim.keymap.set("n", "<leader>sl", fzf.loclist, { desc = "Search loclist" })
    --         vim.keymap.set("n", "<leader>sm", fzf.marks, { desc = "Search marks" })
    --         vim.keymap.set("n", "<leader>sM", fzf.manpages, { desc = "Search manpages" })
    --         vim.keymap.set("n", "<leader>sq", fzf.quickfix, { desc = "Search quickfix" })
    --
    --         -- Misc
    --         vim.keymap.set("n", "<leader>sr", fzf.resume, { desc = "Start resume" })
    --
    --         -- lsp
    --         vim.keymap.set("n", "grd", fzf.lsp_definitions, { desc = "Goto definition" })
    --         vim.keymap.set("n", "grD", fzf.lsp_declarations, { desc = "Goto declaration" })
    --         vim.keymap.set("n", "grr", fzf.lsp_references, { desc = "Goto reference" })
    --         vim.keymap.set("n", "grI", fzf.lsp_implementations, { desc = "Goto implementation" })
    --         vim.keymap.set("n", "gry", fzf.lsp_typedefs, { desc = "Goto type def" })
    --         vim.keymap.set("n", "grds", fzf.lsp_document_symbols, { desc = "Lsp buffer symbols" })
    --         vim.keymap.set("n", "grwS", fzf.lsp_workspace_symbols, { desc = "Lsp workspace symbols" })
    --         vim.keymap.set({ "n", "x" }, "<leader>ca", fzf.lsp_code_actions, { desc = "Lsp code actions" })
    --     end,
    -- },
    {
        "vim-sleuth",
        for_cat = "general.core",
        event = "DeferredUIEnter",
    },
    -- {
    --     "guess-indent.nvim",
    --     event = { "DeferredUIEnter" },
    --     for_cat = "general.core",
    --     after = function()
    --         require("guess-indent").setup({
    --             auto_cmd = true,
    --             override_editorconfig = false,
    --             filetype_exclude = {
    --                 "netrw",
    --                 "tutor",
    --             },
    --             buftype_exclude = {
    --                 "help",
    --                 "nofile",
    --                 "terminal",
    --                 "prompt",
    --             },
    --             on_tab_options = {
    --                 ["expandtab"] = true,
    --             },
    --             on_space_options = {
    --                 ["expandtab"] = true,
    --                 ["tabstop"] = "detected",
    --                 ["softtabstop"] = "detected",
    --                 ["shiftwidth"] = "detected",
    --             },
    --         })
    --     end,
    -- },
    {
        "undotree",
        for_cat = "general.core",
        cmd = { "UndotreeToggle", "UndotreeHide", "UndotreeShow", "UndotreeFocus", "UndotreePersistUndo" },
        keys = { { "<leader>U", "<cmd>UndotreeToggle<CR>", mode = { "n" }, desc = "Undo Tree" } },
        before = function(_)
            vim.g.undotree_WindowLayout = 1
            vim.g.undotree_SplitWidth = 40
        end,
    },
}
