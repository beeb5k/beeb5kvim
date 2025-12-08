return {
    {
        "obsidian.nvim",
        for_cats = "misc",
        event = {
            "BufReadPre " .. vim.fn.expand("~") .. "/Notes/**/*.md",
            "BufNewFile " .. vim.fn.expand("~") .. "/Notes/**/*.md",
        },
        after = function()
            require("obsidian").setup({
                legacy_commands = false,
                workspaces = {
                    {
                        name = "personal",
                        path = "~/Notes",
                    },
                },
            })
        end,
    },
    {
        "typst-preview.nvim",
        ft = "typst",
        for_cats = "misc",
        after = function()
            require("typst-preview").setup({
                debug = false,
                open_cmd = nil,
                port = nil,
                invert_colors = "never",
                follow_cursor = true,
                dependencies_bin = {
                    tinymist = "tinymist",
                    websocat = "websocat",
                },
                extra_args = nil,
                get_root = function(path_of_main_file)
                    local root = os.getenv("TYPST_ROOT")
                    if root then
                        return root
                    end
                    return vim.fn.fnamemodify(path_of_main_file, ":p:h")
                end,
                get_main_file = function(path_of_buffer)
                    return path_of_buffer
                end,
            })
        end,
    },
}
