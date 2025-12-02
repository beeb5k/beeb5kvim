if nixCats("theme") then
    -- require("neopywal").setup({
    --     use_wallust = true,
    --     transparent_background = true,
    -- })

    require("kanagawa-paper").setup({
        undercurl = true,
        transparent = true,
        gutter = false,
        diag_background = true,
        dim_inactive = false,
        terminal_colors = true,
        cache = true,

        styles = {
            comment = { italic = true },
            functions = { italic = false },
            keyword = { italic = false, bold = false },
            statement = { italic = false, bold = false },
            type = { italic = false },
        },
        auto_plugins = true,
    })

    require("everforest").setup({
        background = "soft",
        transparent_background_level = 1,
        italics = true,
        disable_italic_comments = false,
        inlay_hints_background = "dimmed",
        ui_contrast = "low",
        dim_inactive_windows = false,
    })

    require("kanagawa").setup({
        compile = true,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true,
        dimInactive = false,
        terminalColors = true,
        colors = {
            palette = {},
            theme = {
                wave = {},
                lotus = {},
                dragon = {},
                all = { ui = { bg_gutter = "none" } },
            },
        },
        overrides = function(colors)
            local theme = colors.theme
            return {
                BlinkCmpMenuBorder = { bg = theme.ui.bg_p1, fg = theme.ui.shade0 },
                Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
                PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                PmenuSbar = { bg = theme.ui.bg_m1 },
                PmenuThumb = { bg = theme.ui.bg_p2 },
            }
        end,
        theme = "dragon",
        background = {
            dark = "dragon",
            light = "lotus",
        },
    })

    local colorschemer = nixCats.extra("colorscheme")
    if colorschemer ~= "" then
        vim.cmd.colorscheme(colorschemer)
    end
end

return {}
