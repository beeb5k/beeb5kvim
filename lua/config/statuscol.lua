function _G.MyStatusCol()
    local lnum = vim.v.lnum
    local curr = vim.fn.line(".")
    local relnum = vim.wo.relativenumber and math.abs(curr - lnum) or lnum
    if curr == lnum and vim.wo.number then
        relnum = lnum
    end

    -- Fold column logic
    local foldchar = " "
    local foldlevel = vim.fn.foldlevel(lnum)
    local foldclosed = vim.fn.foldclosed(lnum)
    local foldlevel_before = vim.fn.foldlevel(lnum - 1)
    local foldlevel_after = vim.fn.foldlevel(lnum + 1)

    if foldlevel == 0 then
        foldchar = " "
    elseif foldclosed ~= -1 and foldclosed == lnum then
        foldchar = "▷"
    elseif foldlevel > foldlevel_before then
        foldchar = "▽"
        -- foldchar = "╭"
        -- elseif foldlevel > foldlevel_after then
        --     foldchar = "╰"
        -- else
        --     foldchar = "│"
    end

    -- Diagnostic icon logic
    local diag_sign = " "
    local diags = vim.diagnostic.get(0, { lnum = lnum - 1 })
    local severity_icons = {
        [vim.diagnostic.severity.ERROR] = { icon = "", hl = "DiagnosticSignError" },
        [vim.diagnostic.severity.WARN] = { icon = "", hl = "DiagnosticSignWarn" },
        [vim.diagnostic.severity.INFO] = { icon = "󰋼", hl = "DiagnosticSignInfo" },
        [vim.diagnostic.severity.HINT] = { icon = "", hl = "DiagnosticSignHint" },
    }

    local highest = nil
    for _, d in ipairs(diags) do
        if not highest or d.severity < highest then
            highest = d.severity
        end
    end

    if highest then
        local icon_data = severity_icons[highest]
        diag_sign = string.format("%%#%s#%s%%*", icon_data.hl, icon_data.icon)
    end

    -- Format: diagnostic | relnum | fold
    return string.format("%s %s %s ", diag_sign, foldchar, relnum)
end
