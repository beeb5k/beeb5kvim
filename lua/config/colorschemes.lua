if nixCats("theme") then
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

    vim.cmd([[colorscheme kanagawa]])
end

return {}
