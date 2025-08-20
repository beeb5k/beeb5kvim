local pickpick = function(name, args)
    return function()
        Snacks.picker[name](args)
    end
end

return {
    {
        "snacks.nvim",
        for_cat = "general",
        event = { "VimEnter" },
        load = function() end,
        keys = {
            {
                "<leader>_",
                function()
                    Snacks.lazygit.open()
                end,
                mode = { "n" },
                desc = "LazyGit",
            },
            {
                "<leader>de",
                function()
                    Snacks.dim.enable()
                end,
                mode = { "n" },
                desc = "Dim enable",
            },
            {
                "<leader>dd",
                function()
                    Snacks.dim.disable()
                end,
                mode = { "n" },
                desc = "Dim disable",
            },
            {
                "<leader>gc",
                function()
                    Snacks.lazygit.log()
                end,
                mode = { "n" },
                desc = "Lazy[G]it [C]ommit log",
            },
            {
                "<leader>gl",
                function()
                    Snacks.gitbrowse.open()
                end,
                mode = { "n" },
                desc = "[G]oto git [L]ink",
            },
            { "<leader>sf", pickpick("smart"), desc = "Smart Find Files" },
            { "<leader><leader>s", pickpick("buffers"), desc = "Buffers" },
            { "<leader>/", pickpick("grep"), desc = "Grep" },
            { "<leader>:", pickpick("command_history"), desc = "Command History" },
            { "<leader>sn", pickpick("notifications"), desc = "Notification History" },
            -- find
            { "<leader>fb", pickpick("buffers"), desc = "Buffers" },
            {
                "<leader>fc",
                pickpick("files", { cwd = nixCats.settings.unwrappedCfgPath or nixCats.configDir }),
                desc = "Find Config File",
            },
            { "<leader>ff", pickpick("files"), desc = "Find Files" },
            { "<leader>fg", pickpick("git_files"), desc = "Find Git Files" },
            { "<leader>fp", pickpick("projects"), desc = "Projects" },
            { "<leader>fr", pickpick("recent"), desc = "Recent" },
            -- git
            { "<leader>gL", pickpick("git_log_line"), desc = "Git Log Line" },
            { "<leader>gd", pickpick("git_diff"), desc = "Git Diff (Hunks)" },
            -- Grep
            { "<leader>sb", pickpick("lines"), desc = "Buffer Lines" },
            { "<leader>sB", pickpick("grep_buffers"), desc = "Grep Open Buffers" },
            { "<leader>sg", pickpick("grep"), desc = "Grep" },
            { "<leader>sw", pickpick("grep_word"), desc = "Visual selection or word", mode = { "n", "x" } },
            -- search
            { '<leader>s"', pickpick("registers"), desc = "Registers" },
            { "<leader>s/", pickpick("search_history"), desc = "Search History" },
            { "<leader>sa", pickpick("autocmds"), desc = "Autocmds" },
            { "<leader>sb", pickpick("lines"), desc = "Buffer Lines" },
            { "<leader>sc", pickpick("command_history"), desc = "Command History" },
            { "<leader>sC", pickpick("commands"), desc = "Commands" },
            { "<leader>sd", pickpick("diagnostics"), desc = "Diagnostics" },
            { "<leader>sD", pickpick("diagnostics_buffer"), desc = "Buffer Diagnostics" },
            { "<leader>sh", pickpick("help"), desc = "Help Pages" },
            { "<leader>sH", pickpick("highlights"), desc = "Highlights" },
            { "<leader>si", pickpick("icons"), desc = "Icons" },
            { "<leader>sj", pickpick("jumps"), desc = "Jumps" },
            { "<leader>sk", pickpick("keymaps"), desc = "Keymaps" },
            { "<leader>sl", pickpick("loclist"), desc = "Location List" },
            { "<leader>sm", pickpick("marks"), desc = "Marks" },
            { "<leader>sM", pickpick("man"), desc = "Man Pages" },
            { "<leader>sq", pickpick("qflist"), desc = "Quickfix List" },
            { "<leader>sr", pickpick("resume"), desc = "Resume" },
            { "<leader>su", pickpick("undo"), desc = "Undo History" },
            -- LSP
            { "gd", pickpick("lsp_definitions"), desc = "Goto Definition" },
            { "gD", pickpick("lsp_declarations"), desc = "Goto Declaration" },
            { "gr", pickpick("lsp_references"), nowait = true, desc = "References" },
            { "gI", pickpick("lsp_implementations"), desc = "Goto Implementation" },
            { "gy", pickpick("lsp_type_definitions"), desc = "Goto T[y]pe Definition" },
            -- { "<leader>ca", vim.lsp.buf.code_action(), desc = "Lsp code actiona" },
            { "<leader>ds", pickpick("lsp_symbols"), desc = "LSP Symbols" },
            { "<leader>ws", pickpick("lsp_workspace_symbols"), desc = "LSP Workspace Symbols" },
        },
        after = function(_)
            -- NOTE: It is faster when you comment them out
            -- rather than disabling them.
            -- for some reason, they are still required
            -- when you do { enabled = false }
            Snacks.setup({
                -- dashboard = {},
                -- debug = {},
                -- bufdelete = {},
                -- explorer = {},
                -- bigfile = {},
                -- scratch = {},
                -- layout = {},
                -- scroll = {},
                -- notifier = {},
                -- notify = {},
                -- win = {},
                -- picker = {},
                -- profiler = {},
                -- rename = {},
                -- words = {},
                -- toggle = {},

                -- quickfile = {},
                -- input = {},
                -- zen = {
                --     toggles = {
                --         dim = true,
                --         git_signs = false,
                --         signcolumn = "no",
                --         line_number = false,
                --         relative_number = false,
                --     },
                -- },
                -- gitbrowse = {},
                -- lazygit = {},
                -- terminal = {},
                -- indent = {},

                git = {},
                picker = {},
                dim = {},
                scope = {},
                -- statuscolumn = {
                --     left = { "mark", "git" },
                --     right = { "sign", "fold" },
                --     folds = {
                --         open = false,
                --         git_hl = false,
                --     },
                --     git = {
                --         patterns = { "GitSign", "MiniDiffSign" },
                --     },
                --     refresh = 50,
                -- },
            })
        end,
    },
}
