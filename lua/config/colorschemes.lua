if nixCats("theme") then
    vim.g.everforest_background = "medium" -- "soft","medium","hard"
    vim.g.everforest_transparent_background = 1 -- 0 or 1
    vim.g.everforest_enable_italic = 0
    vim.g.everforest_disable_italic_comment = 0
    vim.g.everforest_ui_contrast = "low"
    vim.g.everforest_dim_inactive_windows = 1

    -- sonokai
    vim.g.solokai_brightness = "medium"
    vim.g.solokai_transparent_background = 1
    vim.g.solokai_enable_italic = 0
    vim.g.solokai_disable_italic_comment = 0
    vim.g.solokai_dim_inactive_windows = 1
    vim.g.solokai_style = "default"
    vim.g.solokai_better_performance = 1
    vim.g.solokai_disable_background = 0

    require("kanagawa").setup({
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = false },
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
                all = {
                    ui = {
                        bg_gutter = "none",
                        float = {
                            bg = "none",
                        },
                    },
                },
            },
        },
        overrides = function(colors)
            local theme = colors.theme
            return {
                NormalFloat = { bg = "none" },
                FloatBorder = { bg = "none" },
                FloatTitle = { bg = "none" },
                LineNr = { bg = "none" },
                CursorLineNr = { bg = "none", fg = theme.syn.constant },
                StatusColumn = { bg = "none" },

                NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
                LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

                Pmenu = { bg = "none", fg = theme.ui.shade0 },
                PmenuSel = { bg = theme.ui.bg_p1, fg = theme.ui.fg },
                PmenuBorder = { bg = "none", fg = theme.ui.fg },

                BlinkCmpMenuBorder = { bg = "none", fg = theme.ui.shade0 },
                StatusLine = { bg = "NONE" },
            }
        end,
        theme = "wave",
        background = {
            dark = "wave",
            light = "lotus",
        },
    })

    local colorschemer = nixCats.extra("colorscheme")
    if clorschemer ~= "" then
        vim.cmd.colorscheme(colorschemer)
    end
end

return {}
