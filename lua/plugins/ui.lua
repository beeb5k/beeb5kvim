local plugins = {}
local bimtype = nixCats.extra("pluginChoice")
if bimtype == "fancy" then
    table.insert(plugins, {
        "hlchunk.nvim",
        for_cat = "ui.other",
        event = { "BufReadPre", "BufNewFile" },
        after = function()
            require("hlchunk").setup({
                chunk = {
                    enable = true,
                    chars = {
                        horizontal_line = "─",
                        vertical_line = "│",
                        left_top = "┌",
                        left_bottom = "└",
                        right_arrow = "─",
                    },
                    duration = 0,
                    delay = 100,
                    style = {
                        { fg = vim.api.nvim_get_hl(0, { name = "IblScope" }).fg },
                        { fg = vim.api.nvim_get_hl(0, { name = "Error" }).fg },
                    },
                },
                indent = {
                    enable = true,
                    style = { vim.api.nvim_get_hl(0, { name = "IblIndent" }) },
                },
            })
        end,
    })
elseif bimtype == "normal" then
    table.insert(plugins, {
        "mini.indentscope",
        for_cat = "ui",
        event = { "BufReadPre", "BufNewFile" },
        after = function()
            require("mini.indentscope").setup()
        end,
    })
elseif bimtype == "fast" then
    table.insert(plugins, {
        "indentmini",
        for_cat = "ui.other",
        event = { "BufReadPre", "BufNewFile" },
        after = function()
            require("indentmini").setup()

            local function apply_cs()
                local function hl(name)
                    return vim.api.nvim_get_hl(0, { name = name })
                end

                local indent = hl("IblIndent").fg
                local indent_current = hl("IblScope").fg

                vim.api.nvim_set_hl(0, "IndentLine", { fg = indent })
                vim.api.nvim_set_hl(0, "IndentLineCurrent", { fg = indent_current })
            end

            apply_cs()

            vim.api.nvim_create_autocmd("ColorScheme", {
                callback = apply_cs,
            })
        end,
    })
end
table.insert(plugins, {
    "mini.statusline",
    for_cat = "ui",
    event = "DeferredUIEnter",
    after = function()
        require("mini.statusline").setup()
    end,
})

return plugins
